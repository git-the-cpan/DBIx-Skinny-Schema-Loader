package Mock::MySQL;
use DBIx::Skinny setup => +{};

sub setup_test_db {
    my $self = shift;
    my @statements = (
        qq{
            CREATE TABLE books (
                id         int not null auto_increment primary key,
                author_id  int,
                name       varchar(255)
            )
        },
        qq{
            CREATE TABLE authors (
                id           int,
                gender_name  varchar(255),
                pref_name    varchar(255),
                name         varchar(255)
            )
        },
        qq{
            CREATE TABLE genders (
                name  varchar(255)
            )
        },
        qq{
            CREATE TABLE prefectures (
                id    int,
                name  varchar(255) primary key
            )
        },
        q{ INSERT INTO books VALUES (1, 1, 'mysql') },
    );
    $self->do($_) for @statements;
}

sub clean_test_db {
    my $self = shift;
    my @statements = (
        q{ DROP TABLE prefectures },
        q{ DROP TABLE genders },
        q{ DROP TABLE authors },
        q{ DROP TABLE books },
    );
    $self->do($_) for @statements;
}

1;
