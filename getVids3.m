function [depthVid,colorVid, gigeThermoVid] = getVids3()
clear
tic
isOK =1;

%wieksza jakosc dla kinect v2
if (~exist('colorVid','var') && ~exist('depthVid', 'var'))

    try
        colorVid = videoinput('kinect',1, 'RGB_1280x960');
        %colorVid = videoinput('kinect',1, 'RGB_640x480');
        depthVid = videoinput('kinect',2, 'Depth_640x480');
        disp('Kinect Xbox 360 detected');
        disp('RGB_1280x960');
    catch
        try
            clear colorVid;
            colorVid = videoinput('kinect', 1, 'BGR_1920x1080');
            depthVid = videoinput('kinect', 2, 'Depth_512x424');
            disp('Kinect Xbox One detected');
            disp('BGR_1920x1080');
        catch
        end
        
    end
    
    try
        
        triggerconfig([colorVid depthVid],'manual');
        colorVid.FramesPerTrigger = 1;
        depthVid.FramesPerTrigger = 1;
        %start([colorVid depthVid]);
    catch
        disp ('Unable to connect to kinect');
        isOK=0;
    end
end
if (~exist('gigeThermoVid', 'var'))
    try
        gigeThermoVid=gigecam(1);
    catch
        disp('Unable to connect to Flir A325sc');
        isOK=0;
    end
end
if isOK==0
    clear
    error('Unable to continue program, please connect device');
end
end

