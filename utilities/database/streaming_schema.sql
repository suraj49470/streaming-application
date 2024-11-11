DROP TABLE IF EXISTS Roles;
DROP TABLE IF EXISTS Users;
CREATE TYPE Role AS ENUM ('admin', 'user', 'service');

CREATE TABLE IF NOT EXISTS Roles (
    id SERIAL PRIMARY KEY,
    role_type Role NOT NULL
);

CREATE TABLE IF NOT EXISTS Users (
    id SERIAL PRIMARY KEY,
    firstname VARCHAR(25) NOT NULL,
    lastname VARCHAR(25) NOT NULL,
    dob DATE NOT NULL,
    email VARCHAR(50) NOT NULL,
    password VARCHAR(100) NOT NULL,
    active BOOLEAN NOT NULL,
    role_id INTEGER,
    CONSTRAINT FK_ROLE_ID FOREIGN KEY (role_id) REFERENCES Roles(id),
    CONSTRAINT UK_email UNIQUE (email)
);






-- Insert Data into Roles Table
INSERT INTO Roles (role_type) VALUES
('admin'),
('user'),
('service');

-- Insert Data into Users Table
INSERT INTO Users (firstname, lastname, dob, email, password, active, role_id) VALUES
-- Admin user
('saheel', 'singh', '1988-07-21', 'saheel.singh@streaming.com', 'saheel123', TRUE, 1),

-- Regular users
('suraj', 'singh', '1992-01-15', 'suraj.singh@streaming.com', 'suraj123', TRUE, 2),
('rohan', 'singh', '1995-10-10', 'rohan.singh@streaming.com', 'rohan123', TRUE, 2),
('kajol', 'singh', '1945-10-10', 'kajol.singh@streaming.com', 'kajol123', TRUE, 2),
('geeta', 'singh', '1945-10-13', 'geeta.singh@streaming.com', 'geeta123', TRUE, 2),

-- Service users
('post', 'listing', '1987-11-23', 'post.listing@streaming.com', 'listing123', TRUE, 3), -- Data streaming post listing service
('upload', 'management', '1990-04-18', 'upload.management@streaming.com', 'upload123', TRUE, 3),   -- Streaming upload management service
('media', 'transcoding', '1985-08-30', 'media.transcoding@streaming.com', 'transcode123', TRUE, 3); -- Streaming transcoding service
