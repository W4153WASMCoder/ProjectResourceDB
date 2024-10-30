use db_project_resource;

-- Insert entries into the languages table
INSERT INTO languages (language_id, language_name, compiler_invocation)
VALUES
(1, 'Python', 'python3 {filename}'),
(2, 'Java', 'javac {filename} && java {filenameWithoutExtension}'),
(3, 'JavaScript', 'node {filename}'),
(4, 'C++', 'g++ {filename} -o {filenameWithoutExtension} && ./{filenameWithoutExtension}'),
(5, 'Ruby', 'ruby {filename}');

-- Insert entries into the projects table
INSERT INTO projects (project_id, owning_user_id, project_name, language_name)
VALUES
(1, 1, 'Data Analysis', 'Python'),
(2, 2, 'Web App', 'Java'),
(3, 1, 'Game Development', 'C++'),
(4, 3, 'API Development', 'JavaScript'),
(5, 2, 'Automation Script', 'Ruby');

-- Insert entries into the project_files table
INSERT INTO project_files (file_id, project_id, parent_directory, file_name, is_directory)
VALUES
(1, 1, NULL, 'analysis.py', FALSE),
(2, 1, NULL, 'requirements.txt', FALSE),
(3, 2, NULL, 'WebApp.java', FALSE),
(4, 2, NULL, 'index.html', FALSE),
(5, 3, NULL, 'main.cpp', FALSE),
(6, 3, NULL, 'game_logic.h', FALSE),
(7, 4, NULL, 'api.js', FALSE),
(8, 4, NULL, 'server.js', FALSE),
(9, 5, NULL, 'script.rb', FALSE),
(10, 5, NULL, 'Gemfile', FALSE);