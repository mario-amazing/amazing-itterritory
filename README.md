## Test task:
### Requirements:
It is desirable to use versions: Ruby 2.2+, RoR 4+, PostgreSQL 9.2+.

Task for knowledge of Ruby on Rails:
We have a blog with the following entities:

1. User. It only has a login.
2. The post belongs to the user. It has a title, content, author IP (saved separately for each post).
3. Evaluation belongs to the post. Takes a value from 1 to 5.

Task: create a JSON API on RoR with the following actions:

1. Create a post. It accepts the title and content of the post (they cannot be empty), as well as the author's login and IP address. If the author with such a login does not exist yet, it is necessary to create one. Returns either post attributes with status 200 or validation errors with status 422.
2. Rate the post. Accepts post IDs and values, returns new average post rating. Important: the action must work correctly with any number of competing requests to evaluate the same post.
3. Get the top N posts by average rating. Just an array of objects with titles and content.
4. Get a list of IPAs from which several different authors have posted. An array of objects with fields: IP addresses and an array of author logins.

We use PostgreSQL as a database. For development, write a script in db/seeds.rb that generates test data. Some of the posts must receive grades. The script must use the same code as the controllers, it is possible to pull the server directly with a curler or something else.

There should be at least 200k posts in the database, it is better to make about 100 authors, and 50 different aypishniks should be used. Actions must work fast enough on standard hardware both for the specified volume of data (faster than 100 ms) and for much more, that is, a good margin is needed in terms of request optimization. To do this, you can use data denormalization and any other means of the database. You can use any necessary gems, it is necessary to have heats that cover different cases well. In the code, it is desirable not to use rail antipatterns such as callbacks and validations in models, service classes are our everything. It is also advisable not to use generators and generally avoid unnecessary garbage files in repositories.

Task on knowledge of SQL:
given table users of type - id, group_id

create temp table users(id bigserial, group_id bigint);
insert into users(group_id) values(1), (1), (1), (2), (1), (3);

    1. In this table, ordered by ID, it is necessary:
    2. select continuous groups by group_id taking into account the specified order of records (4 of them)
    3. count the number of records in each group
    4. will calculate the minimum ID of the record in the group

---------------------------------------------------------------

## Тестовое задание:
### Требования:
Желательно использовать версии: Ruby 2.2+, RoR 4+, PostgreSQL 9.2+.

Задание на знания Ruby on Rails:
У нас имеется некий блог со следующими сущностями:

1. Юзер. Имеет только логин.
2. Пост, принадлежит юзеру. Имеет заголовок, содержание, айпи автора (сохраняется отдельно для каждого поста).
3. Оценка, принадлежит посту. Принимает значение от 1 до 5.

Задача: создать JSON API на RoR со следующими экшенами:

1. Создать пост. Принимает заголовок и содержание поста (не могут быть пустыми), а также логин и айпи автора. Если автора с таким логином еще нет, необходимо его создать. Возвращает либо атрибуты поста со статусом 200, либо ошибки валидации со статусом 422.
2. Поставить оценку посту. Принимает айди поста и значение, возвращает новый средний рейтинг поста. Важно: экшен должен корректно отрабатывать при любом количестве конкурентных запросов на оценку одного и того же поста.
3. Получить топ N постов по среднему рейтингу. Просто массив объектов с заголовками и содержанием.
4. Получить список айпи, с которых постило несколько разных авторов. Массив объектов с полями: айпи и массив логинов авторов.

Базу данных используем PostgreSQL. Для девелопмента написать скрипт в db/seeds.rb, который генерирует тестовые данные. Часть постов должна получить оценки. Скрипт должен использовать тот же код, что и контроллеры, можно вообще дергать непосредственно сервер курлом или еще чем-нибудь.

Постов в базе должно быть хотя бы 200к, авторов лучше сделать в районе 100 штук, айпишников использовать штук 50 разных. Экшены должны на стандартном железе работать достаточно быстро как для указанного объема данных (быстрее 100 мс), так и для намного большего, то есть нужен хороший запас в плане оптимизации запросов. Для этого можно использовать денормализацию данных и любые другие средства БД. Можно использовать любые нужные гемы, обязательно наличие спеков, хорошо покрывающих разные кейсы. В коде желательно не использовать рельсовых антипаттернов типа колбеков и валидаций в моделях, сервис-классы наше все. Также желательно не использовать генераторов и вообще обойтись без лишних мусорных файлов в репозитории.

Задание на знание SQL:
дана таблица users вида - id, group_id

create temp table users(id bigserial, group_id bigint);
insert into users(group_id) values (1), (1), (1), (2), (1), (3);

    1. В этой таблице, упорядоченой по ID необходимо:
    2. выделить непрерывные группы по group_id с учетом указанного порядка записей (их 4)
    3. подсчитать количество записей в каждой группе
    4. вычислить минимальный ID записи в группе


