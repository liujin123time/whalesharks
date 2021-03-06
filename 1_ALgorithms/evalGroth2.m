%==========================================================================
% Evaluacion del algoritmo de identificacion de Groth
%
%
%==========================================================================

%resultados=zeros(20,5,10);
resultados=cell(20,5,10);
contEpsilon=0;
individuo0='ind';
   

for epsilon=0.001:0.001:0.01
    
    contEpsilon=contEpsilon+1

   
      for j=1:20
        
        
            numeroToString = int2str(j);
            individuo=horzcat(individuo0,numeroToString,'/');

            % Paths a archivos
       
            PathResul2='/home/lex/2_SISTEMIC/3_MRF/1_Lagartos/2_Dataset/GT_rotado/';%MS 

            extension='*.JPG';

            % Añade path del folder           
            PathResul3=horzcat(PathResul2,individuo);

            %Extrae cantidad de archivos en folder
            archives=dir(horzcat(PathResul3,extension));
            %horzcat(PathIMG2,extension)
            
             for m=1:5
                 % Navega por cada archivo
                PathResul=horzcat(PathResul3,archives(m).name);


                % Carga imagenes                

                Iraw=imread(PathResul);
               % Iraw=imresize(Iraw,[300 300]);% Cambio de tamaño


                centrosOriginal=extractPattern(Iraw);               


                %voting=grothAlgorithm(centrosOriginal,centrosPra,0.01);
                
               
                
                temp=zeros(20,5);
                 for i=1:20


                    numeroToString2 = int2str(i);
                    individuo2=horzcat(individuo0,numeroToString2,'/');

                    % Paths a archivos

                    PathResul7='/home/lex/2_SISTEMIC/3_MRF/1_Lagartos/2_Dataset/GT_rotado/';%MS 

                    extension='*.JPG';%                  if(j==1)
%                      
%                  reemplazo=temp(2:end,:);
%                  
%                  else
%                      
%                  reemplazo=temp(1:j-1,:);
%                  
%                  reemplazo=[reemplazo;temp(j+1:end,:)]
%                  
%                  
%                  
%                  end
%                  
%                               imshow(Iraw2)
%                  waitforbuttonpress
%                  
%                  % Suma de votos
%             
%                      [c1 e1]=max(temp(:,1));
%                      [c2 e2]=max(temp(:,2));
%                      [c3 e3]=max(temp(:,3));
%                      [c4 e4]=max(temp(:,4));
%                      [c5 e5]=max(temp(:,5));
%                      
%                   % for k=1:5
%                      
%                      
%                      if(j== e)
%                          
%                         resultados(j,m,contEpsilon)= resultados(j,m,contEpsilon)+1;   
%                      end
%                  
%                  %end


                    % Añade path del folder           
                    PathResul4=horzcat(PathResul7,individuo2);

                    %Extrae cantidad de archivos en folder
                    archives2=dir(horzcat(PathResul4,extension));
                    %horzcat(PathIMG2,extension)

                    for l=1:5
                        % Navega por cada archivo


                        PathResul5=horzcat(PathResul4,archives2(l).name);

   
                        % Carga imagenes                

                        Iraw2=imread(PathResul5);
                        %Iraw=imresize(Iraw,[300 300]);


                        centrosPra=extractPattern(Iraw2);             

                        % Evaluacion Groth
                        a=grothAlgorithm(centrosOriginal,centrosPra,epsilon);
                        temp(i,l)=a;
                        

                    end

                 end        
                 
                resultados{j,m,contEpsilon}=temp;
                 
%                  if(j==1)
%                      
%                  reemplazo=temp(2:end,:);
%                  
%                  else
%                      
%                  reemplazo=temp(1:j-1,:);
%                  
%                  reemplazo=[reemplazo;temp(j+1:end,:)]
%                  
%                  
%                  
%                  end
%                  
%                               imshow(Iraw2)
%                  waitforbuttonpress
%                  
%                  % Suma de votos
%             
%                      [c1 e1]=max(temp(:,1));
%                      [c2 e2]=max(temp(:,2));
%                      [c3 e3]=max(temp(:,3));
%                      [c4 e4]=max(temp(:,4));
%                      [c5 e5]=max(temp(:,5));
%                      
%                   % for k=1:5
%                      
%                      
%                      if(j== e)
%                          
%                         resultados(j,m,contEpsilon)= resultados(j,m,contEpsilon)+1;   
%                      end
%                  
%                  %end
                 

             end
        
      end    
    
    
    
end