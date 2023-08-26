<?php

return array(
    // Specify whichever keys and values you want to set.
    'example.key' => 'examplevalue',
    'phd.user' => 'phuser',
    'diffusion.ssh-port' => getenv('PH_DIFFUSION_SSH_PORT'),
    'diffusion.ssh-user' => 'vcs',
    'phabricator.base-uri' => 'http://phorge.localhost',
    'mysql.pass' => getenv('PH_MYSQL_PASS'),
    'mysql.user' => 'root',
    'mysql.host' => 'mariadb',
    'storage.mysql-engine.max-size' => 8388608,
    'pygments.enabled' => true,
);