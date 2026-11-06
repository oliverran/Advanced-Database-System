-- Entirely invented fixtures; no historical exports or real banking data.
INSERT INTO branch VALUES
    ('B01', 'Edinburgh'), ('B02', 'Glasgow'), ('B03', 'Dundee');
INSERT INTO customer VALUES
    ('C01', 'Demo Ada'), ('C02', 'Demo Ben'),
    ('C03', 'Demo Cleo'), ('C04', 'Demo Dev');
INSERT INTO account VALUES
    ('A01', 'B01', 'saving', 125000),
    ('A02', 'B01', 'saving', 125000),
    ('A03', 'B01', 'current', 40000),
    ('A04', 'B02', 'saving', 80000),
    ('A05', 'B02', 'current', 20000);
-- A01 is jointly owned: a join has more rows than there are accounts.
INSERT INTO customer_account VALUES
    ('C01', 'A01'), ('C02', 'A01'), ('C03', 'A02'),
    ('C01', 'A03'), ('C04', 'A04'), ('C02', 'A05');
-- UK fictional-use numbers, labelled as fixtures in the tutorial.
INSERT INTO customer_phone VALUES
    ('C01', 'mobile', '07700900001'), ('C01', 'home', '01632960001'),
    ('C02', 'mobile', '07700900002'), ('C02', 'mobile', '07700900003'),
    ('C04', 'home', '01632960004');
INSERT INTO employee VALUES
    ('E01', 'Demo Morgan', 'B01', NULL),
    ('E02', 'Demo Rowan', 'B01', 'E01'),
    ('E03', 'Demo Taylor', 'B02', 'E01'),
    ('E04', 'Demo Quinn', 'B03', NULL);
