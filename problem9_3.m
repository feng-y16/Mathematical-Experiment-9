%%
clear
data=[
35	2	0	0.25 
43	2	0	0.50 
55	2	0	0.75 
47	2	1	0.25 
43	2	1	0.50 
57	2	1	0.75 
26	5	0	0.25 
27	5	0	0.50 
28	5	0	0.75 
29	5	1	0.25 
22	5	1	0.50 
29	5	1	0.75 
19	7	0	0.25 
11	7	0	0.50 
14	7	0	0.75 
23	7	1	0.25 
20	7	1	0.50 
22	7	1	0.75 
13	10	0	0.25 
8	10	0	0.50 
3	10	0	0.75 
27	10	1	0.25 
26	10	1	0.50 
5	10	1	0.75 
];
y=data(:,1);
x0=ones(length(y),1);
x1=data(:,2);
x2=data(:,3);
x3=data(:,4);
X1=[x0,x1,x2,x3,x1.^2,x3.^2,x1.*x2,x1.*x3,x2.*x3];
stepwise(X1(:,2:9),y);
X2=[x0,x1,x1.^2,x1.*x2];
[b2,b2i,r2,r2i,s2]=regress(y,X2);
rcoplot(r2,r2i);
set(gca,'FontSize',28)
set(gcf,'Position',get(0,'ScreenSize'))
saveas(gcf,"33_1.png");
close
yn=y;
X2n=X2;
yn(24)=[];
X2n(24,:)=[];
[b3,b3i,r3,r3i,s3]=regress(yn,X2n);
rcoplot(r3,r3i);
set(gca,'FontSize',28)
set(gcf,'Position',get(0,'ScreenSize'))
saveas(gcf,"33_2.png");
close

X3=[x0,x1,x1.^2,x3.^2,x1.*x2,x1.*x3];
[b4,b4i,r4,r4i,s4]=regress(y,X3);
rcoplot(r3,r3i);
set(gca,'FontSize',28)
set(gcf,'Position',get(0,'ScreenSize'))
saveas(gcf,"34_1.png");
close
yn=y;
X3n=X3;
yn(1)=[];
X3n(1,:)=[];
[b5,b5i,r5,r5i,s5]=regress(yn,X3n);
rcoplot(r5,r5i);
set(gca,'FontSize',28)
set(gcf,'Position',get(0,'ScreenSize'))
saveas(gcf,"34_2.png");
close