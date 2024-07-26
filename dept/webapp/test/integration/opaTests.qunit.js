sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'dept/test/integration/FirstJourney',
		'dept/test/integration/pages/departmentList',
		'dept/test/integration/pages/departmentObjectPage',
		'dept/test/integration/pages/employeeObjectPage'
    ],
    function(JourneyRunner, opaJourney, departmentList, departmentObjectPage, employeeObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('dept') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThedepartmentList: departmentList,
					onThedepartmentObjectPage: departmentObjectPage,
					onTheemployeeObjectPage: employeeObjectPage
                }
            },
            opaJourney.run
        );
    }
);