namespace praneetha;
using { managed, cuid } from '@sap/cds/common';

entity department: cuid, managed {
    @title:'deptno'
    deptno:String(10);
    @title:'deptname'
    deptname:String(20);
    @title:'dloc'
    dloc:String(30);

    emp: Composition of many employee on emp.emp_id = $self;
}

entity employee: cuid, managed {
    @title:'empno'
    emp_id:Association to one department;
    @title:'empname'
    empname:String(20);
    @title:'empjob'
    empjob:String(30);
}
