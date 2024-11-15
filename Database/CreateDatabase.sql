/* Создание перечислений для таблиц Билет и Пользователи */
CREATE TYPE "TicketStatus"
AS ENUM ('Продано', 'Забронировано', 'Свободно');

CREATE TYPE "UserRole"
AS ENUM ('Администратор', 'Кассир', 'Зритель');

/* Таблица актеров */
CREATE TABLE actors(
    actor_id UUID PRIMARY KEY,
    actor_name TEXT NOT NULL,
    surname TEXT NOT NULL,
    patronymic TEXT NULL,
    date_of_birth DATE NOT NULL,
    age INT NOT NULL,
    gender TEXT NOT NULL,
    photo TEXT NULL,
    biography TEXT NULL,
    roles JSONB NULL,
    plays JSONB NULL
);

/* Таблица режиссеров */
CREATE TABLE filmmakers(
    filmmaker_id UUID PRIMARY KEY,
    filmmaker_name TEXT NOT NULL,
    surname TEXT NOT NULL,
    patronymic TEXT NULL,
    date_of_birth DATE NOT NULL,
    age INT NOT NULL,
    gender TEXT NOT NULL,
    photo TEXT NULL,
    biography TEXT NULL,
    plays JSONB NULL
);

/* Таблица постановщиков */
CREATE TABLE stagehands(
    stagehand_id UUID PRIMARY KEY,
    stagehand_name TEXT NOT NULL,
    surname TEXT NOT NULL,
    patronymic TEXT NULL,
    date_of_birth DATE NOT NULL,
	age INT NOT NULL,
    gender TEXT NOT NULL,
    photo TEXT NULL,
    biography TEXT NULL,
    plays JSONB NULL
);

/* Таблица художников */
CREATE TABLE artists(
    artist_id UUID PRIMARY KEY,
    artist_name TEXT NOT NULL,
    surname TEXT NOT NULL,
    patronymic TEXT NULL,
    date_of_birth DATE NOT NULL,
    age INT NOT NULL,
    gender TEXT NOT NULL,
    photo TEXT NULL,
    biography TEXT NULL,
    plays JSONB NULL
);

/* Таблица композиторов */
CREATE TABLE composers(
    composer_id UUID PRIMARY KEY,
    composer_name TEXT NOT NULL,
    surname TEXT NOT NULL,
    patronymic TEXT NULL,
    date_of_birth DATE NOT NULL,
    age INT NOT NULL,
    gender TEXT NOT NULL,
    photo TEXT NULL,
    biography TEXT NULL,
    plays JSONB NULL
);

/* Таблица пьес */
CREATE TABLE pieces(
    piece_id UUID PRIMARY KEY,
    title TEXT NOT NULL,
    author TEXT NOT NULL,
    year_written INT NOT NULL,
    genre TEXT NOT NULL,
    plays JSONB NULL
);

/* Таблица залов */
CREATE TABLE halls(
    hall_id UUID PRIMARY KEY,
    title TEXT NOT NULL,
    description TEXT NULL,
    number_of_seats INT NOT NULL,
    hall_layout JSONB NOT NULL
);

/* Таблица спектаклей */
CREATE TABLE plays(
    play_id UUID PRIMARY KEY,
    title TEXT NOT NULL,
    genre TEXT NOT NULL,
    description TEXT NULL,
    premiere_date DATE NOT NULL,
    Duration TEXT NOT NULL,
    filmmaker_id UUID NOT NULL,
    CONSTRAINT fk_filmmaker
    FOREIGN KEY (filmmaker_id) REFERENCES filmmakers (filmmaker_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    stagehand_id UUID NOT NULL,
    CONSTRAINT fk_stagehand
    FOREIGN KEY (stagehand_id) REFERENCES stagehands (stagehand_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    artist_id UUID NOT NULL,
    CONSTRAINT fk_artist
    FOREIGN KEY (artist_id) REFERENCES artists (artist_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    composer_id UUID NOT NULL,
    CONSTRAINT fk_composer
    FOREIGN KEY (composer_id) REFERENCES composers (composer_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    piece_id UUID UNIQUE NOT NULL,
    CONSTRAINT fk_piece
    FOREIGN KEY (piece_id) REFERENCES pieces (piece_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    acting_cast JSONB NOT NULL,
    photo_reference TEXT NULL,
    video_reference TEXT NULL,
    age_limit INT NOT NULL,
    language_play TEXT NULL,
    reviews JSONB NULL,
    count_tickets_sold INT NOT NULL,
    ticket_sales_start_date DATE NOT NULL,
    ticket_sales_end_date DATE NOT NULL
);

/* Таблица билетов */
CREATE TABLE tickets(
    ticket_id UUID PRIMARY KEY,
    ticket_number INT NOT NULL,
    play_id UUID NOT NULL,
    CONSTRAINT fk_play
    FOREIGN KEY (play_id) REFERENCES plays (play_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    price NUMERIC(5, 2) NOT NULL,
    seat_category TEXT NOT NULL,
    row INT NOT NULL,
    venue INT NOT NULL,
    date_any_time_play TIMESTAMP NOT NULL,
    status "TicketStatus" NOT NULL
);

/* Таблица пользователей */
CREATE TABLE users(
    user_id UUID PRIMARY KEY,
    user_name TEXT NOT NULL,
    surname TEXT NOT NULL,
    email TEXT NULL,
    phone TEXT NULL,
    user_login TEXT NOT NULL,
    user_password TEXT NOT NULL,
    user_role "UserRole" NOT NULL,
    purchase_history JSONB NULL
);

/* Таблица отзывов */
CREATE TABLE reviews(
    review_id UUID PRIMARY KEY,
    user_id UUID NOT NULL,
    CONSTRAINT fk_user
    FOREIGN KEY (user_id) REFERENCES users (user_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    play_id UUID UNIQUE NOT NULL,
    CONSTRAINT fk_play
    FOREIGN KEY (play_id) REFERENCES plays (play_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    review_text TEXT NULL,
    rating INT NOT NULL,
    publication_date TIMESTAMP NOT NULL
);
