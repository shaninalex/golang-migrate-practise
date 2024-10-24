-- example implementing cross schema relation
CREATE TABLE admin.cross_schema_rel (
    event_id uuid NOT NULL DEFAULT uuid_generate_v4(),
    product_id uuid NOT NULL DEFAULT uuid_generate_v4(),
    PRIMARY KEY (event_id, product_id),
    FOREIGN KEY (event_id) REFERENCES admin.calendar_events(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES shop.products(id) ON DELETE CASCADE
);
