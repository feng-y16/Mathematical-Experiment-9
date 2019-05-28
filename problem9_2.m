%%
clear
data=[
196	66.290 	7
63	40.964 	5
252	72.996 	10
84	45.010 	6
126	57.204 	4
14	26.852 	5
49	38.122 	4
49	35.840 	6
266	75.796 	9
49	37.408 	5
105	54.376 	2
98	46.186 	7
77	46.130 	4
14	30.366 	3
56	39.060 	5
245	79.380 	1
133	52.766 	8
133	55.916 	6
];
y=data(:,1);
x0=ones(length(y),1);
x1=data(:,2);%有把握
x2=data(:,3);%有把握
x1_square=x1.^2;%有把握
x2_square=x2.^2;%没底
cross=x1.*x2;%没底
[b1,b1i,r1,r1i,s1]=regress(y,[x0,x1,x2,x1_square]);
[b2,b2i,r2,r2i,s2]=regress(y,[x0,x1,x2,x1_square,x2_square]);
[b3,b3i,r3,r3i,s3]=regress(y,[x0,x1,x2,x1_square,cross]);
[b4,b4i,r4,r4i,s4]=regress(y,[x0,x1,x2,x1_square,x2_square,cross]);
regress_data1=[b1,b1i];
regress_data2=[b2,b2i];
regress_data3=[b3,b3i];
regress_data4=[b4,b4i];
stat_all=[s1;s2;s3;s4];
regress_data_all=[regress_data1;regress_data2;regress_data3;regress_data4];
%%
rcoplot(r1,r1i);
set(gca,'FontSize',28)
set(gcf,'Position',get(0,'ScreenSize'))
saveas(gcf,"21.png");
close
yn=y;
Xn=[x0,x1,x2,x1_square];
yn(5)=[];
Xn(5,:)=[];
[b5,b5i,r5,r5i,s5]=regress(yn,Xn);
rcoplot(r5,r5i);
set(gca,'FontSize',28)
set(gcf,'Position',get(0,'ScreenSize'))
saveas(gcf,"22.png");
close