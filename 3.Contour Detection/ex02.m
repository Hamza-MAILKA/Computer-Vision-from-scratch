clear all
close all
clc
taille=128
% Indices des colonnes � gauche et � droites du contour apr�s avoir enleve les bords de l'image
colG=taille/2-1;
colD=colG+1;
% Cr�ation d'une image bruit�e (diff�rence : d=0.1 variance =1e-3)
I=0.55*ones(taille, taille);
I(:,1:taille/2)=0.45*ones(taille, taille/2);
J=imnoise(I, 'gaussian', 0, 1e-3);
% cr�er les filtres de Prewitt (ph, pv), Sobel (sh,sv), et Robert (ra,rb)
% filtrer l'image J avec ces jeux de filtres
ph=fspecial('prewitt');
pv=ph';
sh=fspecial('sobel');
sv=sh'
ra=[1 0;0 -1];
rb=ra'
%filtre l'image J avec ces jeux de filtres
%filtre l'image J avec prewitt
px=filter2(ph,J);
py=filter2(pv,J);
P=sqrt(px.*px+py.*py)
%filtre l'image J avec sobel
Sx=filter2(sh,J);
Sy=filter2(sv,J);
S=sqrt(Sx.*Sx+Sy.*Sy)
%filtre l'image J avec robert
Rx=filter2(ra,J);
Ry=filter2(rb,J);
R=sqrt(Rx.*Rx+Ry.*Ry)
% on notera P, S, R, les r�sultats avant seuillage
% R�glage des seuils th�oriques pour prob_fa=5e-3
seuilP=0.25;
seuilS=0.35;
seuilR=0.15;
% Calcul des images seuill�es
Ps=P>seuilP;
Ss=S>seuilS;
Rs=R>seuilR;
% On enl�ve les bords, pour �viter les effets de bord
Ps=Ps(2:end-1,2:end-1);
Ss=Ss(2:end-1,2:end-1);
Rs=Rs(2:end-1,2:end-1);
% Afficher les images Ps, Ss, Rs : Commentaires?
% Sommations par colonnes
sumP=sum(Ps);
sumS=sum(Ss);
sumR=sum(Rs);
% Proba de fausse alarme
sumP(colG:colD)=[0,0];
sumS(colG:colD)=[0,0];
sumR(colG:colD)=[0,0];
NbPixHx=(taille-4)*(taille-2);
% Nb de pixels hors-contour
Pfa_Prewitt=sum(sumP)/NbPixHx
Pfa_Sobel=sum(sumS)/NbPixHx
Pfa_Roberts=sum(sumR)/NbPixHx
% Proba de d�tection : on aune bonne d�tection si l'on a un 1 a gauche ou a droite du contour
milieuP=Ps(:,colG)+Ps(:,colD);
milieuS=Ss(:,colG)+Ss(:,colD);
milieuR=Rs(:,colG);
Pdet_Prewitt=sum(milieuP>0)/(taille-2);
Pdet_Sobel=sum(milieuP>0)/(taille-2);
Pdet_Robert=sum(milieuP>0)/(taille-2);