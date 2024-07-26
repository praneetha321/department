using {praneetha as db} from '../db/schema';

service Department {
    entity department as projection on db.department;
}

annotate Department.department with @odata.draft.enabled;

annotate Department.department with @(
    UI.LineItem: [
        {
            $Type: 'UI.DataField',
            Value: deptno
        },
        {
            $Type: 'UI.DataField',
            Value: deptname
        },
        {
            $Type: 'UI.DataField',
            Value: dloc
        }
    ],
    UI.FieldGroup #departmentInformation: {
        $Type: 'UI.FieldGroupType',
        Data: [
            {
                $Type: 'UI.DataField',
                Value: deptno
            },
            {
                $Type: 'UI.DataField',
                Value: deptname
            },
            {
                $Type: 'UI.DataField',
                Value: dloc
            }
        ]
    },
    UI.Facets: [
        {
            $Type: 'UI.ReferenceFacet',
            ID: 'departmentInfoFacet',
            Label: 'Department Information',
            Target: '@UI.FieldGroup#departmentInformation'
        },
        {
            $Type: 'UI.ReferenceFacet',
            ID: 'employeeInfoFacet',
            Label: 'Employee Information',
            Target: 'emp/@UI.LineItem'
        }
    ]
);

annotate Department.employee with @(
    UI.LineItem: [
        {
            $Type: 'UI.DataField',
            Value: emp_id_ID
        },
        {
            $Type: 'UI.DataField',
            Value: empname
        },
        {
            $Type: 'UI.DataField',
            Value: empjob
        }
    ],
    UI.FieldGroup #employeeInformation: {
        $Type: 'UI.FieldGroupType',
        Data: [
            {
                $Type: 'UI.DataField',
                Label: 'Employee ID',
                Value: emp_id_ID
            },
            {
                $Type: 'UI.DataField',
                Value: empname
            },
            {
                $Type: 'UI.DataField',
                Value: empjob
            }
        ]
    },
    UI.Facets: [
        {
            $Type: 'UI.ReferenceFacet',
            ID: 'employeeInfoFacet',
            Label: 'Employee Information',
            Target: '@UI.FieldGroup#employeeInformation'
        }
    ]
);
