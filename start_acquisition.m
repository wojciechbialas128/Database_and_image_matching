function [img1,img2,img3,time1,time2,time3] = start_acquisition(ile_klatek, new_location, save)
%Funkcja do zapisu obrazów 2x kinect oraz termowizja Flir 
    close all;
    if nargin~=3
        save= true;
    end
    [w1,w2,w3]=getVids3();    
    disp('Connections successful');
    [p1,p2,p3]=preview3(w1,w2,w3);
    if (save ==true)
        %disp('Previes done');
        disp('Pause for 5s');
        pause(1);
        disp('Pause for 4s');
        pause(1);
        disp('Pause for 3s');
        pause(1);
        disp('Pause for 2s');
        pause(1);
        disp('Pause for 1s');
        pause(1);
    
    
        timet=datetime;
        timet.Format='yyyy_MM_dd_HH_mm_ss.SSS'; 
        timestart=timet;
      	disp('Start acquisition');
        frame=0;
        for t=1:ile_klatek
            frame=frame+3;
        
            %figure(4);
            pause(0.3);
            img1(:,:,:,t)=p1.CData;
            timet=datetime;
            timet.Format='yyyy_MM_dd_HH_mm_ss.SSS';
            time1(t)=timet;
            
            disp(frame-mod(frame,3));

            img2(:,:,:,t)=p2.CData;
            timet=datetime;
            timet.Format='yyyy_MM_dd_HH_mm_ss.SSS';
            time2(t)=timet;
        
            img3(:,:,:,t)=p3.CData;
            timet=datetime;
            timet.Format='yyyy_MM_dd_HH_mm_ss.SSS';
            time3(t)=timet;
            if (t==100)
                size(img1)
            end
        end
        timeend=timet;
        close all;
        delete(w1);
        delete(w2);
        delete(w3);
        disp('Saving');
        pause(1);
        timet=datetime;
        timet.Format='yyyy_MM_dd_HH_mm_ss.SSS';
            for t=1:ile_klatek
                if nargin>1
                    save3images(img1(:,:,:,t), img2(:,:,:,t), img3(:,:,:,t), time1(t), time2(t), time3(t), new_location);
                else
                    save3images(img1(:,:,:,t), img2(:,:,:,t), img3(:,:,:,t), time1(t), time2(t), time3(t));
                end
                procent=t/ile_klatek;
                procent=procent*100;
                disp(['Zapisano ', num2str(procent),'%']);
            end
        disp ('Akwizycja zakoñczona');
        disp (['Time start = ', string(timestart)]);
        disp ([' Time end  = ', string(timeend)]);
        disp (['Taken 3x', num2str(ile_klatek), ' frames']);
  	end
end

