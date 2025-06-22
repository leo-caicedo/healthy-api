-- Tabla Users (Usuarios)
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    age INT,
    current_weight DECIMAL(5,2),
    height INT,
    gender ENUM('male', 'female', 'other'),
    goal ENUM('lose_weight', 'maintain', 'gain_weight', 'tone_up'),
    activity_level ENUM('sedentary', 'light', 'moderate', 'active', 'very_active'),
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla Exercise (Catálogo de Ejercicios)
CREATE TABLE exercises (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    category ENUM('cardio', 'strength', 'flexibility', 'sports'),
    calories_per_minute DECIMAL(4,2),
    description TEXT,
    muscles_worked JSON, -- Para almacenar array de músculos trabajados
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla Exercise_Record (Registro de Ejercicios del Usuario)
CREATE TABLE exercise_records (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    exercise_id INT NOT NULL,
    exercise_date DATETIME NOT NULL,
    duration_minutes INT NOT NULL,
    calories_burned DECIMAL(6,2),
    intensity ENUM('low', 'medium', 'high'),
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    -- Foreign Keys
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (exercise_id) REFERENCES exercises(id) ON DELETE RESTRICT,

    -- Indexes para mejor performance
    INDEX idx_user_date (user_id, exercise_date),
    INDEX idx_exercise_date (exercise_id, exercise_date)
);

-- Insertar algunos ejercicios de ejemplo
INSERT INTO exercises (name, category, calories_per_minute, description, muscles_worked) VALUES
('Running', 'cardio', 12.5, 'Outdoor or treadmill running', '["legs", "glutes", "core"]'),
('Push-ups', 'strength', 8.0, 'Classic bodyweight exercise', '["chest", "triceps", "shoulders", "core"]'),
('Squats', 'strength', 6.5, 'Bodyweight or weighted squats', '["quadriceps", "glutes", "hamstrings", "core"]'),
('Yoga', 'flexibility', 3.5, 'Yoga practice and poses', '["full_body", "core", "flexibility"]'),
('Cycling', 'cardio', 10.0, 'Indoor or outdoor cycling', '["legs", "glutes", "core"]'),
('Plank', 'strength', 4.0, 'Isometric core exercise', '["core", "shoulders", "arms"]');

-- Crear usuario de ejemplo
INSERT INTO users (name, email, age, current_weight, height, gender, goal, activity_level) VALUES
('Juan Pérez', 'juan.perez@email.com', 28, 75.5, 175, 'male', 'tone_up', 'moderate');