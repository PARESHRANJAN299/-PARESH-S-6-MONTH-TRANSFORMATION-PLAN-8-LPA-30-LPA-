Create Database SAT
CREATE TABLE device_events (
    event_id INT IDENTITY(1,1) PRIMARY KEY,
    device_id VARCHAR(50) NOT NULL,
    event_type VARCHAR(50) NOT NULL,
    event_time DATETIME NOT NULL,
    network_type VARCHAR(30),
    sim_status VARCHAR(30),
    location_city VARCHAR(50),
    battery_level INT,
    is_factory_reset BIT
);


INSERT INTO device_events
(device_id, event_type, event_time, network_type, sim_status, location_city, battery_level, is_factory_reset)
VALUES
('DEV1001', 'DEVICE_BOOT', '2025-01-18 08:30:00', '4G', 'ACTIVE', 'Bhubaneswar', 85, 0),

('DEV1001', 'SIM_CHANGE', '2025-01-18 10:15:00', '4G', 'CHANGED', 'Bhubaneswar', 80, 0),

('DEV1002', 'NETWORK_SHIFT', '2025-01-19 09:45:00', '5G', 'ACTIVE', 'Cuttack', 70, 0),

('DEV1003', 'LOCATION_UPDATE', '2025-01-19 11:20:00', '4G', 'ACTIVE', 'Delhi', 60, 0),

('DEV1001', 'FACTORY_RESET', '2025-01-20 07:10:00', '4G', 'ACTIVE', 'Unknown', 50, 1),

('DEV1004', 'SIM_CHANGE', '2025-01-20 12:40:00', '3G', 'CHANGED', 'Mumbai', 40, 0),

('DEV1005', 'BATTERY_LOW', '2025-01-20 15:00:00', '4G', 'ACTIVE', 'Kolkata', 15, 0),

('DEV1002', 'LOCATION_UPDATE', '2025-01-21 09:05:00', '5G', 'ACTIVE', 'Hyderabad', 65, 0);
