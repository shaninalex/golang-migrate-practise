CREATE TABLE admin."calendar_events" (
    "id" uuid DEFAULT uuid_generate_v4(),
    "owner_id" uuid NOT NULL,
    "recurrent" TEXT,
    "description" TEXT,
    "title" TEXT,
    "active" BOOLEAN DEFAULT true,
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP,
    PRIMARY KEY ("id")
);

CREATE INDEX ON admin."calendar_events"("title");

