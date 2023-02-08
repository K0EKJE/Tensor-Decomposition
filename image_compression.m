RGB = imread("images.jpg");


% T = zeros(1,101);
% Res = zeros(1,101);
% for r = 2:10:52
%     tic
%     model=parafac(double(RGB),r);
%     [A1,A2,A3]=fac2let(model);
%     result = randn(size(double(RGB)));
%     for i = 1:3
%         result(:,:,i) = A3(i,1)*(A1*A2.')+A3(i,2)*(A1*A2.');
%     end
%     res = (( (norm(result,'fro')-norm(double(RGB),'fro'))...
%         /norm(double(RGB),'fro')));
%     subplot(2,3,(r-2)/10+1), imshow(uint8(result)),title(['R = ',...
%         num2str(round(r,3)), ' , res = ', num2str(round(res,3))])
%     Res(r-1) = res;
%     T(r-1)= toc;
% end

% 
% subplot(1,2,1),plot(2:100, T(1:99))
% title('Time(s) VS Rank')
% subplot(1,2,2),plot(2:100, Res(1:99),'r')
% title('Residual VS Rank')

T_t = zeros(1,101);
Res_t = zeros(1,101);
for r = 1:100
    tic
    [Factors,core,ExplX,J] = tucker(double(RGB),[r r 3]);

    res =abs((((norm(J,'fro')-norm(double(RGB),'fro'))...
        /norm(double(RGB),'fro')))) ;
%     
%     subplot(2,3,(r-2)/10+1), imshow(uint8(J)),...
%         title(['R = ',num2str(round(r,3)),',  res = ',num2str(round(abs(res),3))])

    Res_t(r) = res;
    T_t(r)= toc;

end
subplot(1,2,1),plot(1:100, T_t(1:100))
title('Time(s) VS Rank')
subplot(1,2,2),plot(1:100, Res_t(1:100),'r')
title('Residual VS Rank')

