-- create index on label table

CREATE INDEX idx_label
ON label(label_id, name, description, founding_date);