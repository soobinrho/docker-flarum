<?php

/*
 * This file is part of Flarum.
 *
 * (c) Toby Zerner <toby.zerner@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

use Flarum\Extend;

$redisConfig = [
    'host' => \getenv('REDIS_HOST'),
    'password' => null,
    'port' => \getenv('REDIS_PORT'),
    'database' => 1,
    'prefix' => 'flarum_'
];

return [
    new FoF\Console\Extend\EnableConsole(),
    new Bokt\Redis\Extend\EnableRedisCache($redisConfig),
    new Bokt\Redis\Extend\EnableRedisQueue($redisConfig)
];
