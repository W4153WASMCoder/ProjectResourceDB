drop schema if exists db_project_resource;

create schema db_project_resource;

use db_project_resource;

create table if not exists languages(
    language_id             int NOT NULL,
    language_name           nvarchar(100),
    compiler_invocation     nvarchar(500),
    creation_date      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    primary key (language_id),
    UNIQUE (language_name)
);

create table if not exists projects(
    project_id       int NOT NULL,
    owning_user_id    int,
    project_name     nvarchar(100),
    language_name    nvarchar(100),
    creation_date      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    primary key (project_id),
    foreign key (language_name) references languages (language_name)
                                   on delete set null,
    foreign key (owning_user_id) references db_user.users (user_id)
                                   on delete set null
);

create table if not exists project_files(
    file_id         int NOT NULL,
    project_id      int,
    parent_directory      int DEFAULT NULL,
    file_name       nvarchar(100),
    is_directory          bool DEFAULT FALSE,
    creation_date      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    primary key (file_id),
    foreign key (project_id) references projects (project_id)
                          on delete set null,
    foreign key (parent_directory) references project_files (file_id)
                          on delete set null
);

