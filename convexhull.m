%% Function to generate a convex hull,
% input: n: number of 2d points
% output: hull: points on the boundary of convex hull
% output: generated n number of random 2d data
% output: figure visualizing convex hull

function [hull,data]=convexhull(n)
 
% % % generate 2-D points N x 2
data=zeros(n,2);
data(:,1)=randperm(2*n,n);
data(:,2)=randperm(2*n,n);

% Save generated points
%save('data.mat','data');

hull=quickhull(data);

hull=unique(hull,'rows');
hull=hull;

% Draw hull
[~, minidx]=min(hull(:,1));
[~, maxidx]=max(hull(:,1));


%set1 Line y-mx-c=0
m=(hull(maxidx,2)-hull(minidx,2))/(hull(maxidx,1)-hull(minidx,1));
c=hull(maxidx,2)-m*hull(maxidx,1);

dist=[];
dist=hull(:,2)-m*hull(:,1)-c;
set1=find(dist>=0);
set2=find(dist<=0);


%% plotting convex hull
figure()

scatter(data(:,1),data(:,2));
hold on
for i=1:size(set1,1)-1
    x=[hull(set1(i),1) hull(set1(i+1),1)];
    y=[hull(set1(i),2) hull(set1(i+1),2)];
    plot(x,y);

end

x=[hull(set1(1),1) hull(set2(1),1)];
y=[hull(set1(1),2) hull(set2(1),2)];
plot(x,y);    
for i=1:size(set2,1)-1
    x=[hull(set2(i),1) hull(set2(i+1),1)];
    y=[hull(set2(i),2) hull(set2(i+1),2)];
    plot(x,y);
end

title(strcat('Concvex hull of ',' ',num2str(n),' points'));
end