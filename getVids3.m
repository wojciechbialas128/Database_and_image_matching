function [depthVid,colorVid, gigeThermoVid] = getVids3()
clear
tic
    try
        colorVid = videoinput('kinect',1, 'RGB_1280x960');
        depthVid = videoinput('kinect',2, 'Depth_640x480');
        triggerconfig([colorVid depthVid],'manual');
        colorVid.FramesPerTrigger = 1;
        depthVid.FramesPerTrigger = 1;
        %start([colorVid depthVid]);
    catch
        depthVid=0;
        colorVid=0;
        disp ('Unable to connect to kinect');       
    end
    try 
        gigeThermoVid=gigecam(1);
    catch
        gigeThermoVid=0;
        disp('Unable to connect to Flir 325sc');
    end
end

