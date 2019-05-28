%%
clear
data=[
11.2 	16.5 	6.2 	587
13.4 	20.5 	6.4 	643
40.7 	26.3 	9.3 	635
5.3 	16.5 	5.3 	692
24.8 	19.2 	7.3 	1248
12.7 	16.5 	5.9 	643
20.9 	20.2 	6.4 	1964
35.7 	21.3 	7.6 	1531
8.7 	17.2 	4.9 	713
9.6 	14.3 	6.4 	749
14.5 	18.1 	6.0 	7895
26.9 	23.1 	7.4 	762
15.7 	19.1 	5.8 	2793
36.2 	24.7 	8.6 	741
18.1 	18.6 	6.5 	625
28.9 	24.9 	8.3 	854
14.9 	17.9 	6.7 	716
25.8 	22.4 	8.6 	921
21.7 	20.2 	8.4 	595
25.7 	16.9 	6.7 	3353
];
y=data(:,1);
x0=ones(length(y),1);
x1=data(:,2);
x2=data(:,3);
x3=data(:,4);
[b11,b11i,r11,r11i,s11]=regress(y,[x0,x1,x2]);
[b12,b12i,r12,r12i,s12]=regress(y,[x0,x1,x3]);
[b13,b13i,r13,r13i,s13]=regress(y,[x0,x2,x3]);
regress_data11=[b11,b11i];
regress_data12=[b12,b12i];
regress_data13=[b13,b13i];
stat_all_1=[s11;s12;s13];
regress_data_all_1=[regress_data11;regress_data12;regress_data13];

[b21,b21i,r21,r21i,s21]=regress(y,[x0,x1]);
[b22,b22i,r22,r22i,s22]=regress(y,[x0,x2]);
[b23,b23i,r23,r23i,s23]=regress(y,[x0,x3]);
regress_data21=[b21,b21i];
regress_data22=[b22,b22i];
regress_data23=[b23,b23i];
stat_all_2=[s21;s22;s23];
regress_data_all_2=[regress_data21;regress_data22;regress_data23];
%%
[b3,b3i,r3,r3i,s3]=regress(y,[x0,x1,x2,x3]);
[b4,b4i,r4,r4i,s4]=regress(y,x0);
%%
rcoplot(r11,r11i);
set(gca,'FontSize',28)
set(gcf,'Position',get(0,'ScreenSize'))
saveas(gcf,"11.png");
close
yn=y;
x0n=x0;
x1n=x1;
x2n=x2;
x3n=x3;
Xn=[x0,x1,x2];
yn([8,20])=[];
Xn([8,20],:)=[];
[b5,b5i,r5,r5i,s5]=regress(yn,Xn);
rcoplot(r5,r5i);
set(gca,'FontSize',28)
set(gcf,'Position',get(0,'ScreenSize'))
saveas(gcf,"12.png");
close