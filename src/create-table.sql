-- Drop the schema if it exists, then create it
DROP SCHEMA IF EXISTS db_project_resource;
CREATE SCHEMA db_project_resource;

-- Use the new schema
USE db_project_resource;

-- Create the languages table
CREATE TABLE IF NOT EXISTS languages (
    language_id INT AUTO_INCREMENT,
    language_name NVARCHAR(100),
    compiler_invocation NVARCHAR(500),
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (language_id),
    UNIQUE (language_name)
);

-- Create the projects table
CREATE TABLE IF NOT EXISTS projects (
    project_id INT AUTO_INCREMENT,
    owning_user_id INT,
    project_name NVARCHAR(100),
    language_name NVARCHAR(100),
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (project_id),
    FOREIGN KEY (language_name) REFERENCES languages (language_name)
        ON DELETE SET NULL
);

-- Create the project_files table with a self-referencing foreign key for parent directories
CREATE TABLE IF NOT EXISTS project_files (
    file_id INT AUTO_INCREMENT,
    project_id INT,
    parent_directory INT DEFAULT NULL,
    file_name NVARCHAR(100),
    is_directory BOOLEAN DEFAULT FALSE,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (file_id),
    FOREIGN KEY (project_id) REFERENCES projects (project_id)
        ON DELETE SET NULL,
    FOREIGN KEY (parent_directory) REFERENCES project_files (file_id)
        ON DELETE SET NULL
);
