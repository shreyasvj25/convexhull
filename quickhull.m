%% Function to identify the data points which lie on the convex hull
% Input: 2d data
% Output: points which lie on convex hull

% Author: Shreyas Joshi (svjoshi@andrew.cmu.edu)

function hull=quickhull(data)

hull=[];
n=size(data,1);
for i=1:n
    P1x=data(i,1);
    P1y=data(i,2);
    for j=i+1:n
        P2x=data(j,1);
        P2y=data(j,2);
        
        % find line between two sets of points
        m=(P2y-P1y)/(P2x-P1x);
        c=P2y-m*P2x;
          
        % find which points lie above or below the line.
        idx=[];
        idx=data(:,2)-m*data(:,1)-c;
        set1=find(idx>=0);
        set2=find(idx<=0);
        
        % if all points are on the line or above the line 
        if(size(set1,1)==n)
            hull=[hull;[P1x P1y];[P2x P2y]];
        end
        
        %if all points are on the line or below the line
        if(size(set2,1)==n)
            hull=[hull;[P1x P1y];[P2x P2y]];
        end
        
    end
end

        


end