<?php
// Routes

$app->get('/', function ($request, $response, $args) {
    $this->logger->info("'/' route");

    // Render index view
    return $this->renderer->render($response, 'index.phtml', $args);
});

$app->get('/logs', function ($request, $response, $args) {
    // Sample log message
    $this->logger->info("'/logs' route");

    // Render index view
    return $this->renderer->render($response, 'logs.phtml', $args);
});

$app->get('/log/{id}', function ($request, $response, $args) {
    // Sample log message
    $this->logger->info("'/log/" . $args['id'] . "' route");

    // Render index view
    return $this->renderer->render($response, 'log.phtml', $args);
});

$app->get('/export-schema', function ($request, $response, $args) {
    // Sample log message
    $this->logger->info("'/export-schema' route");

    // Render index view
    return $this->renderer->render($response, 'export-schema.phtml', $args);
});

$app->get('/system-updates', function ($request, $response, $args) {
    // Sample log message
    $this->logger->info("'/system-updates' route");

    // Render index view
    return $this->renderer->render($response, 'system-updates.phtml', $args);
});
