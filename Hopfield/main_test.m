clear all;
load w;

% Contants
normX = 50;
normY = 50;

readerobj = VideoReader('vid2.mp4');
vidFrames = read(readerobj);
[x y z numFrames] = size(vidFrames); %get(readerobj, 4)%
for k = 1 :47: numFrames             %4 set as number of skiping frames
    in_fig = vidFrames(:,:,:,k);
    %in_fig = imrotate(in_fig, -90);
    %figure;
    %imshow(in_fig);
    p = crop(in_fig, normX, normY);
    p11 = im2bw_skin(p, normX, normY);
    p = p11;
    %figure;
    %imshow(p);
    tempP = [];
    for i=1:normX
        for j = 1:normY
            tempP = [tempP p(i,j)];
        end
    end
    p = tempP';
    p = 2*p - 1;
    
    rseq = randperm(normX*normY);
    
    for i = 1:(normX*normY)
        net = w*p;
        p(rseq(i)) = sign(net(rseq(i)));
    end
    p = ((p+1)/2);
    m=zeros(normX,normY);
    i1=1;
    for q1=1:normX
        for q2=1:normY
            m(q1,q2)=p(i1);
            i1=i1+1;
        end
    end
    figure;
    imshow(m);
end