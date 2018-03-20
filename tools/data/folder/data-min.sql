INSERT INTO user(id, name, carnet, phone, address, Salary, type, login, password) VALUES 
(1,'admin',222,333,'address',3000,'Admin','admin','admin'),
(2,'admin2',7878,78798,'dir',78,'Admin','admin2','admin2'),
(3,'insumo',789789,789789,'address',7878,'Insumo','insumo','insumo'),
(4,'Employee 1',789789,789789,'address',890890,'Employee','employee','employee'),
(5,'Store',789789,789789,'Address',678678,'Store','alamcen','store');

INSERT INTO company(id, name) VALUES
('10001','APL'),
('10002','ADEPLEC'),
('10004','ACRHOBOL'),
('10005','APLI'),
('10006','ALVA'),
('10007','AMLECO');

INSERT INTO category(name, description) VALUES
('MILK','Description of MILK'),
('GADGETS','Description OF GADGETS');


INSERT INTO customer VALUES 
  (1, 'Daniel Campos', 22333, 22333, 'Address', '2225','Company Name 1', 'status', 0, '2016-06-17 23:53:08');


INSERT INTO product(vendorName, name, currentAmount, cost, totalValue, category) VALUES

('DI',	'Product 1',	'0',	'0',	'0', 'TRUNK'),
('DI',	'Product 2',	'0',	'0',	'0', 'RAWMATERIAL'),
('DI',	'Product 3',	'2',	'0',	'0', 'TRUNK'),
('DI',	'Product 4',	'0',	'0',	'0', 'RAWMATERIAL');

INSERT INTO vendor(name, phone, address, contact, account) VALUES

('Proveedor 1',	'23423233',	'Address 1',	'Contact 1', 1),
('Proveedor 2',	'23423423',	'Address 2',	'Contact 2', 2);


INSERT INTO roles(roleName, roleCode) VALUES 
('Unit of Measure', "measure"),
('Create Unidaded de MCreate edida', "measureCreate"),
('List Unidades MList edida', "measureList"),
('view Unit of Measure', "measureShow"),
('Edit Unit of Measure', "measureEdit"),
('Remove Unit of Measure', "measureDelete"),

('Products', "product"),
('Create Product', "productCreate"),
('List Products', "productList"),
('view Product', "productShow"),
('Edit Product', "productEdit"),
('Remove Product', "productDelete"),

('Vendores', "vendor"),
('Create Vendor', "vendorCreate"),
('List Vendor', "vendorList"),
('view Vendor', "vendorShow"),
('Edit Vendor', "vendorEdit"),
('Remove Vendor', "vendorDelete"),

('Customer', "customer"),
('Create Customer', "customerCreate"),
('List Customer', "customerList"),
('view Customer', "customerShow"),
('Edit Customer', "customerEdit"),
('Remove Customer', "customerDelete"),

('Users', "user"),
('Create Users', "userCreate"),
('List Users', "userList"),
('view Users', "userShow"),
('Edit Users', "userEdit"),
('Remove Users', "userDelete"),

('Accounts', "account"),
('Create Accounts', "accountCreate"),
('List Accounts', "accountList"),
('view Accounts', "accountShow"),
('Edit Accounts', "accountEdit"),
('Remove Accounts', "accountDelete"),

('Transactions', "transaction"),
('Create Transactions', "transactionCreate"),
('List Transactions', "transactionList"),
('view Transactions', "transactionShow"),
('Edit Transactions', "transactionEdit"),
('Remove Transactions', "transactionDelete"),

('Detail of Transaction', "transactionDetail"),
('Create Detail of Transaction', "transactionDetailCreate"),
('List Detail of Transaction', "transactionDetailList"),
('view Detail of Transaction', "transactionDetailShow"),
('Edit Detail of Transaction', "transactionDetailEdit"),
('Remove Detail of Transaction', "transactionDetailDelete"),

('Orders', "productRequest"),
('Create Orders', "productRequestCreate"),
('List Orders', "productRequestList"),
('view Orders', "productRequestShow"),
('Edit Orders', "productRequestEdit"),
('Remove Orders', "productRequestDelete"),
('Enviar Orders', "productRequestSend"),
('Aceptar Orders', "productRequestAccept"),
('Finalizar Orders', "productRequestFinish"),

('Detail of Order', "requestRow"),
('Create Detail of Order', "requestRowCreate"),
('List Detail of Order', "requestRowList"),
('view Detail of Order', "requestRowShow"),
('Edit Detail of Order', "requestRowEdit"),
('Remove Detail of Order', "requestRowDelete"),

('Asignacion de Product a Customer', "requestRowCustomer"),
('Create Asignacion de Product a Customer', "requestRowCustomerCreate"),
('List Asignacion de Product a Customer', "requestRowCustomerList"),
('view Asignacion de Product a Customer', "requestRowCustomerShow"),
('Edit Asignacion de Product a Customer', "requestRowCustomerEdit"),
('Remove Asignacion de Product a Customer', "requestRowCustomerDelete"),

('Report of Discounts', "discountReport"),
('Create Report of Discounts', "discountReportCreate"),
('List Report of Discounts', "discountReportList"),
('view Report of Discounts', "discountReportShow"),
('Edit Report of Discounts', "discountReportEdit"),
('Remove Report of Discounts', "discountReportDelete"),
('Finalizar Report of Discounts', "discountReportFinalize"),

('Detail of Discount', "discountDetail"),
('Create Detail of Discount', "discountDetailCreate"),
('List Detail of Discount', "discountDetailList"),
('view Detail of Discount', "discountDetailShow"),
('Edit Detail of Discount', "discountDetailEdit"),
('Remove Detail of Discount', "discountDetailDelete"),

('Products al Inventario', "productInv"),
('Create Products al Inventario', "productInvCreate"),
('List Products al Inventario', "productInvList"),
('view Products al Inventario', "productInvShow"),
('Edit Products al Inventario', "productInvEdit"),
('Remove Products al Inventario', "productInvDelete"),

('Report', "report"),
('view Balance sheet', "balanceShow"),
('view Journal Book', "diaryShow"),
('view Financial Status', "financeShow"),
('view Libros del Mayor', "mayorShow"),
('view Trial Balance', "sumasSaldosShow"),

('Company Info', "setting"),
('view Company Info', "settingShow"),
('Edit Company Info', "settingEdit");

INSERT INTO `measure`(id, name, quantity, description) VALUES 
(1,'250 ML','250','250 ML'),
(2,'100 ML','100','Description'),
(3,'10gr','10','10 Gramos'),
(4,'80X2mm','2','Description'),
(5,'250cc','250','250cc'),
(6,'20ML','20','Description'),
(7,'500ML','500','500ML'),
(8,'1LITRO','1000','Description'),
(9,'200GRS','200','200GRS'),
(10,'10GRS','10','10GRS'),
(11,'50SOB. X 10GRS.','50','50SOB. X 10GRS.'),
(12,'100 X 1KG','100','100 X 1KG'),
(13,'100 X 25KG','25','100 X 25KG'),
(14,'VALDE X 18KG','1','VALDE X 18KG'),
(15,'VALDE X 4KG','1','VALDE X 4KG'),
(16,'Unidad','1','Unidad'),
(17,'1 ML','1','1 ML'),
(18,'1 GR','1','1 GR');

UPDATE measure SET measureId = 0, measureName = 'Ninguno';

INSERT INTO `account` VALUES (1,'1.0','ACTIVO','ACTIVO',0,'NO','',0,0,0,'2016-07-18 13:19:25'),
(2,'1.1','ACTIVO CORRIENTE','ACTIVO',1,'NO','',0,0,0,'2016-07-18 13:20:01'),
(3,'1.2','ACTIVO NO CORRIENTE','ACTIVO',1,'NO','',0,0,0,'2016-07-18 13:22:30'),
(4,'1.1.1','ACTIVO DISPONIBLE','ACTIVO',2,'NO','',0,0,0,'2016-07-18 13:23:17'),
(5,'1.1.2','ACTIVO EXIGIBLE','ACTIVO',2,'NO','',0,0,0,'2016-07-18 13:24:06'),
(6,'1.1.1.1','CAJA MONEDA NACIONAL','ACTIVO',4,'NO','',0,0,0,'2016-07-18 13:25:19'),
(7,'1.1.1.2','BANCO MONEDA NACIONAL','ACTIVO',4,'NO','',0,0,0,'2016-07-18 13:25:45'),
(8,'1.1.1.1.1','Caja Moneda Nacional','ACTIVO',6,'NO','',1,0,0,'2016-07-18 13:26:28'),
(9,'1.1.1.2.1','Banco Economico M/N','ACTIVO',7,'NO','',1,0,0,'2016-07-18 13:27:09'),
(10,'1.1.2.1','IMPUESTOS POR RECUPERAR','ACTIVO',5,'NO','',0,0,0,'2016-07-18 13:28:52'),
(11,'1.1.2.1.1','IVA Credito Fiscal','ACTIVO',10,'NO','',1,0,0,'2016-07-18 13:29:40'),
(12,'1.2.1','ACTIVO FIJO','ACTIVO',3,'NO','',0,0,0,'2016-07-18 13:31:02'),
(13,'1.2.1.1','MUEBLES Y ENSERES','ACTIVO',12,'NO','',0,0,0,'2016-07-18 13:31:53'),
(14,'1.2.1.1.1','Muebles y Enseres','ACTIVO',13,'NO','',1,0,0,'2016-07-18 13:32:47'),
(15,'1.2.1.1.2','Depreciacion Acum. Muebles Y Enseres','ACTIVO',13,'SI','',1,0,0,'2016-07-18 13:33:32'),
(16,'1.2.1.2','EQUIPO DE COMPUTACION','ACTIVO',12,'NO','',0,0,0,'2016-07-18 13:34:32'),
(17,'1.2.1.2.1','Equipo de Computacion','ACTIVO',16,'NO','',1,0,0,'2016-07-18 13:35:33'),
(18,'1.2.1.2.2','Depreciacion Acumulada Equipo de Computacion','ACTIVO',16,'SI','',1,0,0,'2016-07-18 13:36:27'),
(19,'1.2.1.3','EQUIPO E INSTALACION','ACTIVO',12,'NO','',0,0,0,'2016-07-18 13:37:41'),
(20,'1.2.1.3.1','Equipo e Instalacion','ACTIVO',19,'NO','',1,0,0,'2016-07-18 13:38:49'),
(21,'1.2.1.3.2','Depreciacion Acumulada Equipo e Instalacion','ACTIVO',19,'SI','',1,0,0,'2016-07-18 13:39:28'),
(22,'3.0','PATRIMONIO','PATRIMONIO',0,'NO','',0,0,0,'2016-07-18 13:41:44'),
(23,'3.1','PATRIMONIO','PATRIMONIO',22,'NO','',0,0,0,'2016-07-18 13:43:35'),
(24,'3.2','PERDIDA DE LA GESTION','PATRIMONIO',22,'NO','',0,0,0,'2016-07-18 13:44:35'),
(25,'3.1.1','Capital','PATRIMONIO',23,'NO','',1,0,0,'2016-07-18 13:45:56'),
(26,'3.1.2','Ajuste de Capital','PATRIMONIO',23,'NO','',1,0,0,'2016-07-18 13:46:46'),
(27,'3.1.3','Resultados Acumulados','PATRIMONIO',23,'NO','',1,0,0,'2016-07-18 13:47:19'),
(28,'3.2.1','Perdida de la Gestion','PATRIMONIO',24,'NO','',1,0,0,'2016-07-18 13:47:57'),
(29,'2.0','PASIVO','PASIVO',0,'NO','',1,0,0,'2016-07-18 13:49:22'),
(30,'4.0','INCOMES','INCOME',0,'NO','',0,0,0,'2016-07-18 13:59:18'),
(31,'4.1','INCOMES OPERATIVOS','INCOME',30,'NO','',0,0,0,'2016-07-18 14:04:49'),
(32,'4.1.1','INCOMES POR VENTAS','INCOME',31,'NO','',1,0,0,'2016-07-18 14:07:29'),
(33,'4.1.1.1','Income por Aportes de Socios','INCOME',33,'NO','',0,0,0,'2016-07-18 14:08:18'),
(34,'4.2','OTROS INCOMES','INCOME',30,'NO','',0,0,0,'2016-07-18 14:08:50'),
(35,'4.2.1','INCOMES NO OPERATIVOS','INCOME',34,'NO','',0,0,0,'2016-07-18 14:10:23'),
(36,'4.2.1.1','Diferencia de Redondeos','INCOME',35,'NO','',1,0,0,'2016-07-18 14:10:52'),
(37,'4.2.1.2','Incomes Reexpresados','INCOME',33,'NO','',1,0,0,'2016-07-18 14:11:42'),
(38,'4.0','GASTOS','OUTCOME',0,'NO','',0,0,0,'2016-07-18 14:15:48'),
(39,'4.1','GASTOS DE OPERATION','OUTCOME',38,'NO','',0,0,0,'2016-07-18 14:16:12'),
(40,'4.1.1','COMBUSTIBLE Y LUBRICANTES','OUTCOME',39,'NO','',0,0,0,'2016-07-18 14:16:57'),
(41,'4.1.1.1','Combustibles','OUTCOME',40,'NO','',1,0,0,'2016-07-18 14:17:23'),
(42,'4.1.2','CORREOS Y COURIER','OUTCOME',39,'NO','',0,0,0,'2016-07-18 14:17:54'),
(43,'4.1.2.1','Correos y Courier','OUTCOME',42,'NO','',1,0,0,'2016-07-18 14:18:16'),
(44,'4.1.3','DEPRECIACIONES DEL ACTIVO FIJO','OUTCOME',39,'NO','',0,0,0,'2016-07-18 14:19:09'),
(45,'4.1.3.1','Depreciacion Equipo de Computacion','OUTCOME',44,'NO','',1,0,0,'2016-07-18 14:20:02'),
(46,'4.1.3.2','Depreciacion Equipo de Instalacion','OUTCOME',44,'NO','',1,0,0,'2016-07-18 14:20:35'),
(47,'4.1.3.3','Depreciacion Muebles y Enseres','OUTCOME',44,'NO','',1,0,0,'2016-07-18 14:21:02'),
(48,'4.1.4','GASTOS GENERALES','OUTCOME',39,'NO','',0,0,0,'2016-07-18 14:23:39'),
(49,'4.1.4.1','Gastos de Representacion','OUTCOME',48,'NO','',1,0,0,'2016-07-18 14:24:07'),
(50,'4.1.4.2','Gastos Generales','OUTCOME',48,'NO','',1,0,0,'2016-07-18 14:24:32'),
(51,'4.1.4.3','Refrigerios al Personal','OUTCOME',48,'NO','',1,0,0,'2016-07-18 14:25:03'),
(52,'4.1.5','SERVICIOS PROFECIONALES Y COMERCIALES','OUTCOME',39,'NO','',0,0,0,'2016-07-18 14:26:05'),
(53,'4.1.5.1','Imprenta y Papelera','OUTCOME',52,'NO','',1,0,0,'2016-07-18 14:26:35'),
(54,'4.1.5.2','Propaganda y Publicidad','OUTCOME',52,'NO','',1,0,0,'2016-07-18 14:27:09'),
(55,'4.1.6','MANTENIMIENTO Y REPARACIONES','OUTCOME',39,'NO','',0,0,0,'2016-07-18 14:28:34'),
(56,'4.1.6.1','Accesorios y Repuestos','OUTCOME',55,'NO','',1,0,0,'2016-07-18 14:29:26'),
(57,'4.1.6.2','Mantenimiento Vehiculo','OUTCOME',55,'NO','',1,0,0,'2016-07-18 14:29:46'),
(58,'4.1.7','MATERIALES DE ESCRITORIO Y OTROS MATERIALES','OUTCOME',39,'NO','',0,0,0,'2016-07-18 14:30:30'),
(59,'4.1.7.1','Materiales de Escritorio y Oficina','OUTCOME',58,'NO','',1,0,0,'2016-07-18 14:31:01'),
(60,'4.1.7.2','Material Electrico','OUTCOME',58,'NO','',1,0,0,'2016-07-18 14:31:40'),
(61,'4.1.8','PASAJES Y TRANSPORTES','OUTCOME',39,'NO','',0,0,0,'2016-07-18 14:32:16'),
(62,'4.1.8.1','Pasajes','OUTCOME',61,'NO','',1,0,0,'2016-07-18 14:32:34'),
(63,'4.1.9','SERVICIOS BASICOS','OUTCOME',39,'NO','',0,0,0,'2016-07-18 14:33:26'),
(64,'4.1.9.1','Servicios Telefonicos','OUTCOME',63,'NO','',1,0,0,'2016-07-18 14:33:54'),
(65,'4.1.10','TRAMITES LEGALES','OUTCOME',39,'NO','',0,0,0,'2016-07-18 14:34:23'),
(66,'4.1.10.1','Gastos legales y de tramites','OUTCOME',65,'NO','',1,0,0,'2016-07-18 14:34:46'),
(67,'4.2','OTROS OUTCOMES','OUTCOME',38,'NO','',0,0,0,'2016-07-18 14:35:28'),
(68,'4.2.1','Diferencia de Redondeos','OUTCOME',67,'NO','',1,0,0,'2016-07-18 14:35:57'),
(69,'4.2.2','AITB','OUTCOME',67,'NO','',1,0,0,'2016-07-18 14:36:14'),
(70,'4.2.3','Outcomes Reexpresados','OUTCOME',67,'NO','',1,0,0,'2016-07-18 14:36:39');

UPDATE product SET measureId = 16, measureName="Unidad" where measureId = 0;

UPDATE product SET cost = 10, percent = 0.1, price = 11 , price = 11 where cost = 0;

UPDATE product SET stockLimit = 10;

INSERT INTO `setting`(id, name, president, language, description) VALUES 
(1, 'Dyamsoft Company','Luis Arce','us','Description');

UPDATE product SET description = 'description';

UPDATE product SET vendorCode = 0;
