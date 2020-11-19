usersテーブル

| Column     |Type     |Options  |
| -----------|---------|-------- |
| email      |string   |         |
| password   |string   |         |
| name       |string   |         |
| profile    |text     |         |
| occupation |text     |         |
| position   |text     |         |

prototypesテーブル

| Column     |Type               |Options                    |
| -----------|------------- |------------------------------- |
| title      |string        |                                |
| catch_copy |text          |                                |
| concept    |text          |                                |
| user       |references    |null: false, foreign_key: true  |

commentsテーブル

| Column     |Type         |Options                         |
| -----------|-------------|------------------------------- |
| text       |text         |                                |
| user       |references   |null: false, foreign_key: true  |
| prototype  |references   |null: false, foreign_key: true  |