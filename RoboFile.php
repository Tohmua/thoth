<?php

use Monolog\Handler\StreamHandler;
use Monolog\Logger;
use Ramsey\Uuid\Uuid;

/**
 * This is project's console commands configuration for Robo task runner.
 *
 * @see http://robo.li/
 */
class RoboFile extends \Robo\Tasks
{
    public function run()
    {
        $logger = new Logger('RunTask');
        $logger->pushHandler(new StreamHandler(__DIR__ . '/logs/export.log', Logger::DEBUG));
        $uuid = Uuid::uuid4()->toString();

        $logger->info('Testing connection to server.', ['id' => $uuid]);
        $connection = $this->connection();
        if ($connection->getExitCode() !== 0) {
            $logger->critical('Connection to server failed.', ['id' => $uuid]);
            return $connection;
        }

        $logger->info('Downloading ZIP file.', ['id' => $uuid]);
        $download = $this->download();
        if ($download->getExitCode() !== 0) {
            $logger->critical('Failed downloading the ZIP file.', ['id' => $uuid]);
            return $download;
        }

        $logger->info('Checking the ZIP archive\'s MD5 hash.', ['id' => $uuid]);
        $md5 = $this->md5();
        if ($md5->getExitCode() !== 0) {
            $logger->critical('ZIP file MD5 Hash doesn\'t match the expected MD5 Hash.', ['id' => $uuid]);
            return $md5;
        }

        $logger->info('Extracting the ZIP archive.', ['id' => $uuid]);
        $extract = $this->extract();
        if ($extract->getExitCode() !== 0) {
            $logger->critical('Failed extracting the ZIP archive.', ['id' => $uuid]);
            return $extract;
        }

        $logger->info('Cleaning up files.', ['id' => $uuid]);
        $delete = $this->delete();
        if ($delete->getExitCode() !== 0) {
            $logger->critical('Failed cleaning up files.', ['id' => $uuid]);
            return $delete;
        }
    }

    public function connection()
    {
        $collection = $this->collection();

        $this->taskWget()
             ->url('http://192.168.20.56/iaptus/html/export/')
             ->outputFile(__DIR__ . '/logs/access.txt')
             ->addToCollection($collection);

        $this->taskCompareStrings(
                $this->taskReadFile(__DIR__ . '/logs/access.txt')->run(),
                'Welcome Authenticated User'
             )
             ->addToCollection($collection);

        return $collection->run();
    }

    public function download()
    {
        return $this->taskWget()
                    ->url('http://192.168.20.56/iaptus/html/export/?zip')
                    ->contentDisposition()
                    ->outputDirectory(__DIR__ . '/downloads/zip/')
                    ->run();
    }

    public function md5()
    {
        $collection = $this->collection();

        $this->taskWget()
             ->url('http://192.168.20.56/iaptus/html/export/?zipmd5')
             ->outputFile(__DIR__ . '/logs/md5.txt')
             ->addToCollection($collection);

        $this->taskCompareStrings(
                $this->taskReadFile(__DIR__ . '/logs/md5.txt')->run(),
                $this->taskCheckMd5(__DIR__ . '/downloads/zip/export-101-20160305.zip')->run()
             )->addToCollection($collection);

        return $collection->run();
    }

    public function extract()
    {
        $directory = __DIR__ . '/downloads/2016-03-05/';

        $collection = $this->collection();

        $this->taskDeleteDir($directory)->addToCollection($collection);

        $this->taskExtract(__DIR__ . '/downloads/zip/export-101-20160305.zip')
             ->to($directory)
             ->addToCollection($collection);

        return $collection->run();
    }

    public function delete()
    {
        return $this->taskCleanDir([__DIR__ . '/downloads/zip/'])->run();
    }

}