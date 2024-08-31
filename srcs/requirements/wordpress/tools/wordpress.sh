#!/bin/sh

sleep 10


service php7.4-fpm start

mkdir -p /var/www/html
cd /var/www/html


https://www.googleadservices.com/pagead/aclk?nis=4&sa=L&ai=CEuLX2yizZuyRKruz9fgP3sqE0AiC99mZefPXtKPIEvGLsb_zQhABIJrtgypg-fOxDqAB0oXHwgPIAQmpAqFfPDN4_V8-qAMByAPLBKoEiAJP0DMpu97CkIvwROIe4yupE6EAdqWmxIfJDg55CASfOUurJvLnd81WPhJ-HIOZCkYMnCQnF8tkeHUuQ0KI7QDLR04fYOxcpU4a0CoC8UxkLuOr4zbfvlYUkAvG02oVqWPgGdzQFbGroqfNbny6vJCp6E-0xLuxsLULpuyJEVeXw0RyxLLj1o4mw6dbH_EZCQLxer84S505izCjG0m7sr0FEGhpqyHIgGX1lXYeA9mq5xIARs5znB_ZAnJ5H5GCM5-PGRyFLTj64V6SkZyD1HGXACaXExbKo6UQQVUD0QGzaHH4rKo20GNw1Ct3EiApjXBVrvzY52rGTjR8Vyf4Vv2hrK-Q95cO3yXABLbnr6foBIgFktjH4E3ABQX6BQYIJRABGAOQBgGgBi6AB4DH-LMBiAcBkAcCqAfZtrECqAemvhuoB47OG6gHk9gbqAfulrECqAf-nrECqAevvrECqAeaBqgH89EbqAeW2BuoB6qbsQKoB4OtsQKoB-C9sQKoB_-esQKoB9-fsQKoB8qpsQKoB-ulsQKoB-qxsQKoB5m1sQKoB763sQKoB_jCsQLYBwDACAXSCCcIABACGBoyAQA6Dp_QgICAgASAwICAgKAoSL39wTpYzL3IkbTihwOACgGQCwOYCwHICwGADAHaDBAKChCgwf_PxuHohnMSAgEDqg0CTUHIDQHgEojm5u3b5LHWItgTC9AVAZgWAfgWAYAXAbIXAhgBshgJEgLATxguIgEB6BgB&ae=1&ase=2&gclid=Cj0KCQjwtsy1BhD7ARIsAHOi4xZJLaQU3rj3_5PoiqyYCKY4xL0kPedG8ocGjd2hMMx_WyCBwQhIRpwaAp0vEALw_wcB&num=1&cid=CAQSQwDpaXnfrO1p0lWk3s6fD5MIwZ7C_U0OuzfVrgGyAUHUUbuTRzjrx-BIRc1WEVJbj28NhApEf9gq6JBd_8Yk_Wu34KgYAQ&sig=AOD64_1FmmBQByua25HuCOh89cUDptIWJw&ctype=5&client=ca-pub-5858701597017660&nb=9&adurl=https://www.defacto.com/fr-ma/regular-fit-uzun-kollu-elbise-3100171%3Ftarget%3Dadwords%26gclid%3DCj0KCQjwtsy1BhD7ARIsAHOi4xZJLaQU3rj3_5PoiqyYCKY4xL0kPedG8ocGjd2hMMx_WyCBwQhIRpwaAp0vEALw_wcB
wp core download --allow-root

wp config create --allow-root --dbname=$DATABASE_NAME --dbuser=$WP_ADMIN_LOGIN --dbpass=$PASSWORD --dbhost=$DB_HOST
wp core install --allow-root --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN_LOGIN --admin_password=$PASSWORD --admin_email=$WP_ADMIN_EMAIL


wp user create --allow-root iassafe17 iassafe17@gmail.com --user_pass=123 --role=$WP_USER_ROLE




service php7.4-fpm stop

php-fpm7.4 -F


