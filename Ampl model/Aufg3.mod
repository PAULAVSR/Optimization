
set year;

param cost {year};
param rate {year};

var bond {i in year} >=0;
var account {i in year} >=0;

minimize repay: sum {i in year} (bond[i]*rate[i]);

subject to constraint1:	account[1]=bond[1]-cost[1];
subject to constraint2:	account[2]=bond[2]-cost[2]+account[1]*1.069;
subject to constraint3:	account[3]=bond[3]-cost[3]+account[2]*1.069;
subject to constraint4:	account[4]=bond[4]-cost[4]+account[3]*1.069;
subject to constraint5:	account[5]=bond[5]-cost[5]+account[4]*1.069;
subject to constraint6:	account[6]=bond[6]-cost[6]+account[5]*1.069;

# Aufgabenteil 2:
# subject to constraint7: bond[1]=20;


