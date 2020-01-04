function [depthVid,colorVid, gigeThermoVid] = getVids3()
clear
tic
    isOK =1;
    try
        colorVid = videoinput('kinect',1, 'RGB_1280x960');
        depthVid = videoinput('kinect',2, 'Depth_640x480');
        triggerconfig([colorVid depthVid],'manual');
        colorVid.FramesPerTrigger = 1;
        depthVid.FramesPerTrigger = 1;
        %start([colorVid depthVid]);
    catch
        disp ('Unable to connect to kinect'); 
        isOK=0;
    end
    try 
        gigeThermoVid=gigecam(1);
    catch
        disp('Unable to connect to Flir 325sc');
        isOK=0;
    end
    if isOK==0
        clear
        error('Unable to continue program, please connect device'); 
    end
end

