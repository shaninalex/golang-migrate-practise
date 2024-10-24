CREATE TABLE admin.log (
    id uuid DEFAULT uuid_generate_v4(),
    title TEXT NOT NULL,
    PRIMARY KEY (id)
);
