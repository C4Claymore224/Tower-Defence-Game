-- Create a table named 'scores' to store player scores
CREATE TABLE scores (
                        id INTEGER PRIMARY KEY AUTOINCREMENT, -- Unique identifier for each score entry, auto-incremented
                        rank INTEGER NOT NULL,                -- Rank of the player based on their score
                        player TEXT NOT NULL,                 -- Name of the player
                        score INTEGER NOT NULL                -- Score achieved by the player
);