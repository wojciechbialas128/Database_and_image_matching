function [imgd, imgc, imgt, timed, timec, timet] = take_preview_3_screens(pdv, pcv, ptv)
  %funckji nale¿y podaæ obiekt, który siê otwiera po otawrciu preview
   imgd=pdv.get('CData');
   timed=datetime;
   timed.Format='yyyy_MM_dd_HH_mm_ss.SSS';
   imgc=pcv.get('CData');
   timec=datetime;
   timec.Format='yyyy_MM_dd_HH_mm_ss.SSS';
   imgt=ptv.get('CData');
   timet=datetime;
   timet.Format='yyyy_MM_dd_HH_mm_ss.SSS';
end

