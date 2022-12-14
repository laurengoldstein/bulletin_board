SET foreign_key_checks = 0;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS student_projects;
DROP TABLE IF EXISTS classrooms;
SET foreign_key_checks = 1;

CREATE TABLE users(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(100) NULL,
    last_name VARCHAR(100) NULL,
    role VARCHAR(50) NOT NULL,
    classroom_id INT UNSIGNED NOT NULL,
    primary key (id)
);


CREATE TABLE classrooms(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    classroom_name VARCHAR(100) NOT NULL,
    assignment_title VARCHAR(100) NOT NULL,
    assignment_desc VARCHAR(255) NULL,
    primary key (id)
);

CREATE TABLE student_projects(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    title VARCHAR(100) NULL,
    description TEXT NULL,
    image_url VARCHAR(255) NULL,
    project_url VARCHAR(255) NOT NULL,
    classroom_id INT UNSIGNED NOT NULL,
    primary key (id)
);

SET foreign_key_checks = 0;
ALTER TABLE
    student_projects ADD CONSTRAINT student_projects_user_id_foreign FOREIGN KEY(user_id) REFERENCES users(id);
ALTER TABLE
    users ADD CONSTRAINT users_classroom_id_foreign FOREIGN KEY(classroom_id) REFERENCES classrooms(id);
ALTER TABLE
    student_projects ADD CONSTRAINT student_projects_classroom_id_foreign FOREIGN KEY(classroom_id) REFERENCES classrooms(id);


INSERT INTO classrooms (classroom_name, assignment_title, assignment_desc)
    VALUES ("Mr. Goleman's 5th Grade Classroom", 'Ancient Egpyt Project', 'Students will research a topic of their choice and create a project to show their findings.');

INSERT INTO users (first_name, last_name, role, classroom_id)
    VALUES ('Michael', 'Goleman', 'teacher', 1), ('Sara', 'Norgaard', 'student', 1), ('Stu', 'Selwig', 'student', 3);

INSERT INTO student_projects (user_id, title, description, image_url, project_url, classroom_id)
    VALUES (2, 'Mummies', 'I researched how mummies were made in Ancient Egypt', 'https://media.istockphoto.com/photos/close-up-of-ancient-mummy-casket-picture-id139982295?k=20&m=139982295&s=612x612&w=0&h=pfmGRS8icf9lncFeljSyWJdAYJDIL-8eiLA3aqJpR60=', 'https://www.bbc.com/news/world-middle-east-56926005', 1),
    (3, 'Triangles', 'I found triangles in nature', 'https://i0.wp.com/thesmarthappyproject.com/wp-content/uploads/2016/05/IMG_0007.jpg?resize=768%2C1024&ssl=1', 'https://thesmarthappyproject.com/triangles/', 3);
SET foreign_key_checks = 1;
