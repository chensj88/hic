--HIS链接服务器服务器 住院
exec sp_addlinkedserver 'HLHT_ZY_HIS','','SQLOLEDB','129.9.1.68'  
exec sp_addlinkedsrvlogin 'HLHT_ZY_HIS','false',null,'ssa','20031118' 
--HIS链接服务器服务器 门诊
exec sp_addlinkedserver 'HLHT_MZ_HIS','','SQLOLEDB','129.9.1.68'  
exec sp_addlinkedsrvlogin 'HLHT_MZ_HIS','false',null,'ssa','20031118'
--HIS链接服务器服务器 住院
exec sp_addlinkedserver 'HLHT_ZY_HIS','','SQLOLEDB','172.16.0.200\ssgj'
exec sp_addlinkedsrvlogin 'HLHT_ZY_HIS','false',null,'sa','zyc@8468'
--HIS链接服务器服务器 门诊
exec sp_addlinkedserver 'HLHT_MZ_HIS','','SQLOLEDB','172.16.0.200\ssgj'
exec sp_addlinkedsrvlogin 'HLHT_MZ_HIS','false',null,'sa','zyc@8468'
