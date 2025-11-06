-- Категории
INSERT INTO category (id, name, parent_id) VALUES
(1, 'Бытовая техника', NULL),
(2, 'Стиральные машины', 1),
(3, 'Холодильники', 1),
(4, 'Телевизоры', 1),
(5, 'Однокамерные', 3),
(6, 'Двухкамерные', 3),
(7, 'Компьютеры', NULL),
(8, 'Ноутбуки', 7),
(9, '17"', 8),
(10, '19"', 8),
(11, 'Моноблоки', 7);

-- Товары
INSERT INTO product (name, quantity, price, category_id) VALUES
('LG TwinWash', 5, 50000, 2),
('Samsung CoolOne', 3, 40000, 5),
('Bosch CoolTwo', 2, 60000, 6),
('Sony Bravia', 4, 70000, 4),
('HP Pavilion 17"', 5, 80000, 9),
('Dell Inspiron 19"', 3, 90000, 10),
('iMac 24"', 2, 120000, 11);

-- Клиенты
INSERT INTO client (name, address) VALUES
('Иванов Иван', 'Москва'),
('Петров Петр', 'СПБ');

-- Заказы
INSERT INTO customer_order (id, client_id) VALUES
(1, 1),
(2, 2);

-- Позиции в заказах
INSERT INTO order_item (order_id, product_id, quantity) VALUES
(1, 1, 1),
(1, 2, 2),
(1, 5, 1),
(2, 3, 1),
(2, 4, 1),
(2, 7, 1);
