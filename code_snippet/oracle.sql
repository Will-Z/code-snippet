--新建序列
CREATE SEQUENCE  zmp.SEQ_VM_ORDER_ID
MINVALUE 1
MAXVALUE 999999999999999999999999999
INCREMENT BY 1
START WITH 1
CACHE 20
NOORDER
NOCYCLE;


-------------------------------------------------------------------------------------------------------新建表  主键 外键
create table zmp.T_VM  (
  T_VM_ID              NUMBER(6)                       not null,
  T_VM_CUR_ORDER_ID    NUMBER(9),
  T_VM_IP              VARCHAR2(12),
  T_VM_USER            VARCHAR2(60),
  T_VM_PSW             VARCHAR2(60),
  T_VM_STATE           VARCHAR2(1),
  T_VM_STATE_TIME      DATE,
  constraint PK_T_VM primary key (T_VM_ID)
);

--表注释
COMMENT ON TABLE ZMP.T_VM IS '虚拟机';
 

--外键
alter table zmp.T_VM
  add constraint FK_T_VM_REFERENCE_T_VM_ORD foreign key (T_VM_CUR_ORDER_ID)
references zmp.T_VM_ORDER (VM_ORDER_ID);


----------------------------------------------------------------------------------------------------------增加字段和注释
alter  table zmp.t_vm_order  add  cpu_mem_type varchar2(60) ;
comment on column zmp.t_vm_order.cpu_mem_type is '计算资源类型';

--------------------------------------------------------------------------------------------------------------

【oracle数据库操作】


【基本操作】
对字段操作		操作方法
更新字段名		alter table TABLE_NAME rename column column_old to column_new;
添加字段			alter table TABLE_NAME add COLUMN_NAME varchar(10);
删除字段			alter table TABLE_NAME drop column COLUMN_NAME;
添加字段并附值	alter table TABLE_NAME ADD COLUMN_NAME NUMBER(1) DEFAULT 1;
修改字段值		update TABLE_NAME set filedname=value where filedname=value;
修改字段数据类型	alter table tablename modify filedname varchar2(20);



--------------------------------------------------------------------------------------------------------------------层次查询
---[1]
select * from org
start with org_id = 1102
connect by prior up_org_id = org_id

---[2]
select area_id, up_ariea_id, area_name, area_level
from zmp_contract.area_id
start with area id = 206
connect by prior up_area_id = area_id;


----------------------------------------------------------------------------------------------------------锁表相关
--[查被锁的表]
select b.owner,b.object_name,a.session_id,a.locked_mode
from v$locked_object a,dba_objects b
where b.object_id = a.object_id;

--[查看是哪个session引起的锁表]
select b.username,b.sid,b.serial#,logon_time  
from v$locked_object a,v$session b  
where a.session_id = b.sid order by b.logon_time;

--[杀掉对应进程]

执行命令：alter system kill session'1025,41';
其中1025为sid,41为serial#。