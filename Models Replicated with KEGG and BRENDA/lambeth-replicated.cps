<?xml version="1.0" encoding="UTF-8"?>
<!-- generated with COPASI 4.35 (Build 258) (http://www.copasi.org) at 2023-03-02T14:18:01Z -->
<?oxygen RNGSchema="http://www.copasi.org/static/schema/CopasiML.rng" type="xml"?>
<COPASI xmlns="http://www.copasi.org/static/schema" versionMajor="4" versionMinor="35" versionDevel="258" copasiSourcesModified="0">
  <ListOfFunctions>
    <Function key="Function_40" name="function for v2 [1]" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_40">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        ((Vfpglm*G1P/Kpglmg1p)-(Vfpglm*Kpglmg6p/(Kpglmg1p*16.62))*G6P/Kpglmg6p)/(1 + G1P/Kpglmg1p + G6P/Kpglmg6p)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_264" name="Vfpglm" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_263" name="G1P" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_262" name="Kpglmg1p" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_261" name="Kpglmg6p" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_250" name="G6P" order="4" role="product"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_41" name="funtion for v1 [1]" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_41">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        fracA*((Vfgly*Ph*GLY/(KgpAigly*KgpApi))/(1 + GLY/KgpAglyf + Ph/KgpApi + GLY*Ph/(KgpAglyf*KgpAipi) + GLY/KgpAglyb + G1P/KgpAg1p + GLY*G1P/(KgpAig1p*KgpAglyb)) - ((Vfgly*KgpAglyb*KgpAig1p/(KgpAigly*KgpApi*0.31))*G1P*GLY/(KgpAglyb*KgpAig1p))/ (1 + GLY/KgpAglyf + Ph/KgpApi + GLY*Ph/ (KgpAglyf*KgpAipi) + GLY/KgpAglyb + G1P/KgpAg1p + GLY*G1P/(KgpAig1p*KgpAglyb))) + fracB*((((amp^nH)/((Kgpamp^nH)*0.02))/ (1 + (amp^nH)/((Kgpamp^nH)*0.02))*(Vfgly*Ph*GLY/(KgpBiglyf*KgpBpi))/((1 + GLY/KgpBipi + Ph/KgpBiglyf + GLY/KgpBiglyb + G1P/KgpBig1p + GLY*Ph/(KgpBiglyf*KgpBpi) + GLY*G1P/(KgpBg1p*KgpBiglyb)))) - (((amp^nH)/((Kgpamp^nH)*0.02))/(1 + (amp^nH)/((Kgpamp^nH)*0.02))*((Vfgly*KgpBg1p*KgpBiglyb/(KgpBiglyf*KgpBpi*0.31))*G1P*GLY/(KgpBg1p*KgpBiglyb))/((1 + GLY/KgpBipi + Ph/KgpBiglyf + GLY/KgpBiglyb + G1P/KgpBig1p + GLY*Ph/(KgpBiglyf*KgpBpi) + GLY*G1P/(KgpBg1p*KgpBiglyb)))))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_269" name="fracA" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_268" name="Vfgly" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_267" name="Ph" order="2" role="substrate"/>
        <ParameterDescription key="FunctionParameter_266" name="GLY" order="3" role="substrate"/>
        <ParameterDescription key="FunctionParameter_265" name="KgpAigly" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_270" name="KgpApi" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_271" name="KgpAglyf" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_272" name="KgpAipi" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_273" name="KgpAglyb" order="8" role="constant"/>
        <ParameterDescription key="FunctionParameter_274" name="G1P" order="9" role="product"/>
        <ParameterDescription key="FunctionParameter_275" name="KgpAg1p" order="10" role="constant"/>
        <ParameterDescription key="FunctionParameter_276" name="KgpAig1p" order="11" role="constant"/>
        <ParameterDescription key="FunctionParameter_277" name="fracB" order="12" role="constant"/>
        <ParameterDescription key="FunctionParameter_278" name="amp" order="13" role="constant"/>
        <ParameterDescription key="FunctionParameter_279" name="nH" order="14" role="constant"/>
        <ParameterDescription key="FunctionParameter_280" name="Kgpamp" order="15" role="constant"/>
        <ParameterDescription key="FunctionParameter_281" name="KgpBiglyf" order="16" role="constant"/>
        <ParameterDescription key="FunctionParameter_282" name="KgpBpi" order="17" role="constant"/>
        <ParameterDescription key="FunctionParameter_283" name="KgpBipi" order="18" role="constant"/>
        <ParameterDescription key="FunctionParameter_284" name="KgpBiglyb" order="19" role="constant"/>
        <ParameterDescription key="FunctionParameter_285" name="KgpBig1p" order="20" role="constant"/>
        <ParameterDescription key="FunctionParameter_286" name="KgpBg1p" order="21" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_42" name="v4 [1]" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_42">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        (Vfpfk*atp*F6P*(1 + (Kpfkatp*Kpfkf6p*Lo*(1 + (en*amp)/Kpfkamp)^4*(1 + atp/Kpfkiatp)^4*((1 + atp/KpfkatpT)*(1 + F6P/Kpfkf6pT) + FDP/KpfkfdpT + (adp*(1 + FDP/KpfkfdpT))/KpfkadpT)^3)/(KpfkatpT*Kpfkf6pT*(1 + amp/Kpfkamp)^4*(1 + (dn*atp)/Kpfkiatp)^4*((1 + atp/Kpfkatp)*(1 + F6P/Kpfkf6p) + FDP/Kpfkfdp + (adp*(1 + FDP/Kpfkfdp))/Kpfkadp)^3)))/(Kpfkatp*Kpfkf6p*((1 + atp/Kpfkatp)*(1 + F6P/Kpfkf6p) + FDP/Kpfkfdp + (adp*(1 + FDP/Kpfkfdp))/Kpfkadp)*(1 + (Lo*(1 + (en*amp)/Kpfkamp)^4*(1 + atp/Kpfkiatp)^4*((1 + atp/KpfkatpT)*(1 + F6P/Kpfkf6pT) + FDP/KpfkfdpT + (adp*(1 + FDP/KpfkfdpT))/KpfkadpT)^4)/((1 + amp/Kpfkamp)^4*(1 + (dn*atp)/Kpfkiatp)^4*((1 + atp/Kpfkatp)*(1 + F6P/Kpfkf6p) + FDP/Kpfkfdp + (adp*(1 + FDP/Kpfkfdp))/Kpfkadp)^4))) - (0.004117429077284144*Vfpfk*adp*FDP*(1 + (Kpfkatp*Kpfkf6p*Lo*(1 + (en*amp)/Kpfkamp)^4*(1 + atp/Kpfkiatp)^4*((1 + atp/KpfkatpT)*(1 + F6P/Kpfkf6pT) + FDP/KpfkfdpT + (adp*(1 + FDP/KpfkfdpT))/KpfkadpT)^3)/(KpfkatpT*Kpfkf6pT*(1 + amp/Kpfkamp)^4*(1 + (dn*atp)/Kpfkiatp)^4*((1 + atp/Kpfkatp)*(1 + F6P/Kpfkf6p) + FDP/Kpfkfdp + (adp*(1 + FDP/Kpfkfdp))/Kpfkadp)^3)))/(Kpfkatp*Kpfkf6p*((1 + atp/Kpfkatp)*(1 + F6P/Kpfkf6p) + FDP/Kpfkfdp + (adp*(1 + FDP/Kpfkfdp))/Kpfkadp)*(1 + (Lo*(1 + (en*amp)/Kpfkamp)^4*(1 + atp/Kpfkiatp)^4* ((1 + atp/KpfkatpT)*(1 + F6P/Kpfkf6pT) + FDP/KpfkfdpT + (adp*(1 + FDP/KpfkfdpT))/KpfkadpT)^4)/((1 + amp/Kpfkamp)^4*(1 + (dn*atp)/Kpfkiatp)^4*((1 + atp/Kpfkatp)*(1 + F6P/Kpfkf6p) + FDP/Kpfkfdp + (adp*(1 + FDP/Kpfkfdp))/Kpfkadp)^4)))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_308" name="Vfpfk" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_307" name="atp" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_306" name="F6P" order="2" role="substrate"/>
        <ParameterDescription key="FunctionParameter_305" name="Kpfkatp" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_304" name="Kpfkf6p" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_303" name="Lo" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_302" name="en" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_301" name="amp" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_300" name="Kpfkamp" order="8" role="constant"/>
        <ParameterDescription key="FunctionParameter_299" name="Kpfkiatp" order="9" role="constant"/>
        <ParameterDescription key="FunctionParameter_298" name="KpfkatpT" order="10" role="constant"/>
        <ParameterDescription key="FunctionParameter_297" name="Kpfkf6pT" order="11" role="constant"/>
        <ParameterDescription key="FunctionParameter_296" name="FDP" order="12" role="product"/>
        <ParameterDescription key="FunctionParameter_295" name="KpfkfdpT" order="13" role="constant"/>
        <ParameterDescription key="FunctionParameter_294" name="adp" order="14" role="product"/>
        <ParameterDescription key="FunctionParameter_293" name="KpfkadpT" order="15" role="constant"/>
        <ParameterDescription key="FunctionParameter_292" name="dn" order="16" role="constant"/>
        <ParameterDescription key="FunctionParameter_291" name="Kpfkfdp" order="17" role="constant"/>
        <ParameterDescription key="FunctionParameter_290" name="Kpfkadp" order="18" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_43" name="v7 [1]" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_43">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        ((-11.235955056179776*Vfgad*DPG*NADH)/(Kgapdhgap*Kgapdhnad*Kgapdhpi) + (Vfgad*GAP*NAD*Ph)/(Kgapdhgap*Kgapdhnad*Kgapdhpi))/(1 + DPG/Kgapdh13dpg + GAP/Kgapdhgap + NAD/Kgapdhnad + (GAP*NAD)/(Kgapdhgap*Kgapdhnad) + NADH/Kgapdhnadh + (DPG*NADH)/(Kgapdh13dpg*Kgapdhnadh) + Ph/Kgapdhpi + (GAP*NAD*Ph)/(Kgapdhgap*Kgapdhnad*Kgapdhpi))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_324" name="Vfgad" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_323" name="DPG" order="1" role="product"/>
        <ParameterDescription key="FunctionParameter_322" name="NADH" order="2" role="product"/>
        <ParameterDescription key="FunctionParameter_321" name="Kgapdhgap" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_320" name="Kgapdhnad" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_319" name="Kgapdhpi" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_318" name="GAP" order="6" role="substrate"/>
        <ParameterDescription key="FunctionParameter_317" name="NAD" order="7" role="substrate"/>
        <ParameterDescription key="FunctionParameter_316" name="Ph" order="8" role="substrate"/>
        <ParameterDescription key="FunctionParameter_315" name="Kgapdh13dpg" order="9" role="constant"/>
        <ParameterDescription key="FunctionParameter_314" name="Kgapdhnadh" order="10" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_44" name="function v8 [1]" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_44">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        ((57109*Vbpgk*adp*DPG)/(Kpgk3pg*Kpgkatp) - (Vbpgk*atp*P3G)/(Kpgk3pg*Kpgkatp))/(1 + adp/Kpgkadp + atp/Kpgkatp + DPG/Kpgk13dpg + (adp*DPG)/(Kpgk13dpg*Kpgkadp) + P3G/Kpgk3pg + (atp*P3G)/(Kpgk3pg*Kpgkatp))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_327" name="Vbpgk" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_326" name="adp" order="1" role="product"/>
        <ParameterDescription key="FunctionParameter_325" name="DPG" order="2" role="product"/>
        <ParameterDescription key="FunctionParameter_289" name="Kpgk3pg" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_288" name="Kpgkatp" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_287" name="atp" order="5" role="substrate"/>
        <ParameterDescription key="FunctionParameter_309" name="P3G" order="6" role="substrate"/>
        <ParameterDescription key="FunctionParameter_310" name="Kpgkadp" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_311" name="Kpgk13dpg" order="8" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_45" name="v11 [1]" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_45">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        (Vfpk*PEP*adp/(Kpkpep*Kpkadp)-(Vfpk*Kpkpyr*Kpkatp/(Kpkpep*Kpkadp*10304))*PYR*atp/(Kpkpyr*Kpkatp))/(1+PEP/Kpkpep+adp/Kpkadp + PEP*adp/(Kpkpep*Kpkadp) + atp/Kpkatp + PYR/Kpkpyr + PYR*atp/(Kpkpyr*Kpkatp))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_334" name="Vfpk" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_333" name="PEP" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_332" name="adp" order="2" role="substrate"/>
        <ParameterDescription key="FunctionParameter_331" name="Kpkpep" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_330" name="Kpkadp" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_329" name="Kpkpyr" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_328" name="Kpkatp" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_313" name="PYR" order="7" role="product"/>
        <ParameterDescription key="FunctionParameter_312" name="atp" order="8" role="product"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_46" name="v12 [1]" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_46">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        ((Vfldh*PYR*NADH/(Kldhpyr*Kldhnadh))-((Vfldh*Kldhlac*Kldhnad/(Kldhpyr*Kldhnadh*16198))*LAC*NAD/(Kldhlac*Kldhnad)))/(1 + PYR/Kldhpyr + NADH/Kldhnadh + PYR*NADH/(Kldhpyr*Kldhnadh) + LAC/Kldhlac + NAD/Kldhnad + LAC*NAD/(Kldhlac*Kldhnad))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_343" name="Vfldh" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_342" name="PYR" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_341" name="NADH" order="2" role="substrate"/>
        <ParameterDescription key="FunctionParameter_340" name="Kldhpyr" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_339" name="Kldhnadh" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_338" name="Kldhlac" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_337" name="Kldhnad" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_336" name="LAC" order="7" role="product"/>
        <ParameterDescription key="FunctionParameter_335" name="NAD" order="8" role="product"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_47" name="v3 [1]" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_47">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        (((Vbpgi*Kpgig6p/Kpgif6p*0.45)*G6P/Kpgig6p)-(Vbpgi*F6P/Kpgif6p))/(1+F6P/Kpgif6p + G6P/Kpgig6p)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_352" name="Vbpgi" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_351" name="Kpgig6p" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_350" name="Kpgif6p" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_349" name="G6P" order="3" role="substrate"/>
        <ParameterDescription key="FunctionParameter_348" name="F6P" order="4" role="product"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_48" name="v5 [1]" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_48">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        ((Vfald*FDP/Kaldfdp)- ((Vfald*Kaldgap*Kalddhap/(Kaldfdp*0.000095))*DHAP*GAP/(Kaldgap*Kalddhap)))/(1+FDP/Kaldfdp+GAP/Kaldgap + DHAP/Kalddhap)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_353" name="Vfald" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_344" name="FDP" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_345" name="Kaldfdp" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_346" name="Kaldgap" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_347" name="Kalddhap" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_354" name="DHAP" order="5" role="product"/>
        <ParameterDescription key="FunctionParameter_355" name="GAP" order="6" role="product"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_49" name="v6 [1]" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_49">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        ((Vftpi*GAP/Ktpigap)-((Vftpi*Ktpidhap/(Ktpigap*19.2))*DHAP/Ktpidhap))/(1 + GAP/Ktpigap + DHAP/Ktpidhap)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_362" name="Vftpi" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_361" name="GAP" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_360" name="Ktpigap" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_359" name="Ktpidhap" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_358" name="DHAP" order="4" role="product"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_50" name="v9 [1]" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_50">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        ((Vfpgm*P3G/Kpgm3pg)-((Vfpgm*Kpgm2pg/(Kpgm3pg*0.18))*P2G/Kpgm2pg))/(1+P3G/Kpgm3pg + P2G/Kpgm2pg)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_365" name="Vfpgm" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_364" name="P3G" order="1" role="product"/>
        <ParameterDescription key="FunctionParameter_363" name="Kpgm3pg" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_356" name="Kpgm2pg" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_357" name="P2G" order="4" role="substrate"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_51" name="v10 [1]" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_51">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        ((Vfen*P2G/Ken2pg)-((Vfen*Kenpep/(Ken2pg*0.49))*PEP/Kenpep))/(1+P2G/Ken2pg + PEP/Kenpep)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_370" name="Vfen" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_369" name="P2G" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_368" name="Ken2pg" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_367" name="Kenpep" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_366" name="PEP" order="4" role="product"/>
      </ListOfParameterDescriptions>
    </Function>
  </ListOfFunctions>
  <Model key="Model_0" name="Glycolysis / Gluconeogenesis" simulationType="time" timeUnit="s" volumeUnit="l" areaUnit="m²" lengthUnit="m" quantityUnit="mol" type="deterministic" avogadroConstant="6.0221417899999999e+23">
    <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:bqmodel="http://biomodels.net/model-qualifiers/"
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns:vCard="http://www.w3.org/2001/vcard-rdf/3.0#">
  <rdf:Description rdf:about="#Model_0">
    <bqmodel:isDerivedFrom>
      <rdf:Bag>
        <rdf:li rdf:resource="urn:miriam:kegg.pathway:hsa00010"/>
      </rdf:Bag>
    </bqmodel:isDerivedFrom>
    <dcterms:bibliographicCitation>
      <rdf:Bag>
        <rdf:li>
          <rdf:Description>
            <CopasiMT:isDescribedBy rdf:resource="urn:miriam:pubmed:21700675"/>
          </rdf:Description>
        </rdf:li>
      </rdf:Bag>
    </dcterms:bibliographicCitation>
    <dcterms:bibliographicCitation>
      <rdf:Bag>
        <rdf:li>
          <rdf:Description>
            <CopasiMT:isDescribedBy rdf:resource="urn:miriam:pubmed:9847135"/>
          </rdf:Description>
        </rdf:li>
      </rdf:Bag>
    </dcterms:bibliographicCitation>
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2023-02-09T11:53:22Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
    <dcterms:creator>
      <rdf:Bag>
        <rdf:li>
          <rdf:Description>
            <vCard:ORG>
              <rdf:Description>
                <vCard:Orgname>ZBIT, University of Tübingen, WSI-CogSys</vCard:Orgname>
              </rdf:Description>
            </vCard:ORG>
          </rdf:Description>
        </rdf:li>
      </rdf:Bag>
    </dcterms:creator>
    <dcterms:modified>
      <rdf:Description>
        <dcterms:W3CDTF>2023-02-09T11:53:22Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:modified>
  </rdf:Description>
</rdf:RDF>

    </MiriamAnnotation>
    <Comment>
      <body xmlns="http://www.w3.org/1999/xhtml">
    <h1>Model of “Glycolysis / Gluconeogenesis”</h1>
    <a href="https://www.kegg.jp/kegg/pathway/hsa/hsa00010.png" title="Graphical representation hosted by KEGG">
      <img src="https://www.kegg.jp/kegg/pathway/hsa/hsa00010.png" alt="Glycolysis / Gluconeogenesis" />
    </a>
    <br />
        (PNG image hosted by the Kyoto Encyclopedia of Genes and Genomes, KEGG).    <br />
    <p>KGML comment: “Creation date: May 7, 2020 16:11:53 +0900 (GMT+9)”      <br />
          KGML version was: 0.72      <br /></p>
    <p>This model has been automatically generated by      <a href="http://identifiers.org/pubmed/21700675" title="Access publication about KEGGtranslator">KEGGtranslator</a>
          V2.3.0 (KEGGtranslator: visualizing and converting the KEGG PATHWAY database to various formats. Wrzodek C, Dräger A, Zell A.      <i>Bioinformatics</i>
          . 2011,      <b>27</b>
          :2314-2315) using information coming from the KEGG PATHWAY Database (      <a href="https://www.kegg.jp/kegg-bin/show_pathway?hsa00010" title="Original pathway">original pathway</a>
          ).      </p></body>
    </Comment>
    <ListOfCompartments>
      <Compartment key="Compartment_0" name="default" simulationType="fixed" dimensionality="3" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Compartment_0">
    <CopasiMT:is rdf:resource="urn:miriam:sbo:SBO:0000410" />
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Compartment>
    </ListOfCompartments>
    <ListOfMetabolites>
      <Metabolite key="Metabolite_0" name="P2G" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_0">
    <CopasiMT:is rdf:resource="urn:miriam:sbo:SBO:0000247" />
    <CopasiMT:isDescribedBy>
      <rdf:Bag>
        <rdf:li rdf:resource="urn:miriam:obo.eco:ECO%3A0000313" />
      </rdf:Bag>
    </CopasiMT:isDescribedBy>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <Comment>
          <body xmlns="http://www.w3.org/1999/xhtml">
    <a href="https://www.kegg.jp/dbget-bin/www_bget?C00631:2-Phospho-D-glycerate;">Original Kegg Entry</a>
    <br />
  </body>
        </Comment>
      </Metabolite>
      <Metabolite key="Metabolite_1" name="DHAP" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1">
    <CopasiMT:is rdf:resource="urn:miriam:sbo:SBO:0000247" />
    <CopasiMT:isDescribedBy>
      <rdf:Bag>
        <rdf:li rdf:resource="urn:miriam:obo.eco:ECO%3A0000313" />
      </rdf:Bag>
    </CopasiMT:isDescribedBy>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <Comment>
          <body xmlns="http://www.w3.org/1999/xhtml">
    <a href="https://www.kegg.jp/dbget-bin/www_bget?C00111:Glycerone phosphate;">Original Kegg Entry</a>
    <br />
  </body>
        </Comment>
      </Metabolite>
      <Metabolite key="Metabolite_2" name="G6P" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_2">
    <CopasiMT:is rdf:resource="urn:miriam:sbo:SBO:0000247" />
    <CopasiMT:isDescribedBy>
      <rdf:Bag>
        <rdf:li rdf:resource="urn:miriam:obo.eco:ECO%3A0000313" />
      </rdf:Bag>
    </CopasiMT:isDescribedBy>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <Comment>
          <body xmlns="http://www.w3.org/1999/xhtml">
    <a href="https://www.kegg.jp/dbget-bin/www_bget?C00668:alpha-D-Glucose 6-phosphate">Original Kegg Entry</a>
    <br />
  </body>
        </Comment>
      </Metabolite>
      <Metabolite key="Metabolite_3" name="F6P" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_3">
    <CopasiMT:is rdf:resource="urn:miriam:sbo:SBO:0000247" />
    <CopasiMT:isDescribedBy>
      <rdf:Bag>
        <rdf:li rdf:resource="urn:miriam:obo.eco:ECO%3A0000313" />
      </rdf:Bag>
    </CopasiMT:isDescribedBy>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <Comment>
          <body xmlns="http://www.w3.org/1999/xhtml">
    <a href="https://www.kegg.jp/dbget-bin/www_bget?C05345:beta-D-Fructose 6-phosphate;">Original Kegg Entry</a>
    <br />
  </body>
        </Comment>
      </Metabolite>
      <Metabolite key="Metabolite_4" name="PEP" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_4">
    <CopasiMT:is rdf:resource="urn:miriam:sbo:SBO:0000247" />
    <CopasiMT:isDescribedBy>
      <rdf:Bag>
        <rdf:li rdf:resource="urn:miriam:obo.eco:ECO%3A0000313" />
      </rdf:Bag>
    </CopasiMT:isDescribedBy>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <Comment>
          <body xmlns="http://www.w3.org/1999/xhtml">
    <a href="https://www.kegg.jp/dbget-bin/www_bget?C00074:Phosphoenolpyruvate;">Original Kegg Entry</a>
    <br />
  </body>
        </Comment>
      </Metabolite>
      <Metabolite key="Metabolite_5" name="P3G" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_5">
    <CopasiMT:is rdf:resource="urn:miriam:sbo:SBO:0000247" />
    <CopasiMT:isDescribedBy>
      <rdf:Bag>
        <rdf:li rdf:resource="urn:miriam:obo.eco:ECO%3A0000313" />
      </rdf:Bag>
    </CopasiMT:isDescribedBy>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <Comment>
          <body xmlns="http://www.w3.org/1999/xhtml">
    <a href="https://www.kegg.jp/dbget-bin/www_bget?C00197:3-Phospho-D-glycerate;">Original Kegg Entry</a>
    <br />
  </body>
        </Comment>
      </Metabolite>
      <Metabolite key="Metabolite_6" name="DPG" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_6">
    <CopasiMT:is rdf:resource="urn:miriam:sbo:SBO:0000247" />
    <CopasiMT:isDescribedBy>
      <rdf:Bag>
        <rdf:li rdf:resource="urn:miriam:obo.eco:ECO%3A0000313" />
      </rdf:Bag>
    </CopasiMT:isDescribedBy>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <Comment>
          <body xmlns="http://www.w3.org/1999/xhtml">
    <a href="https://www.kegg.jp/dbget-bin/www_bget?C00236:3-Phospho-D-glyceroyl phosphate;">Original Kegg Entry</a>
    <br />
  </body>
        </Comment>
      </Metabolite>
      <Metabolite key="Metabolite_7" name="PYR" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_7">
    <CopasiMT:is rdf:resource="urn:miriam:sbo:SBO:0000247" />
    <CopasiMT:isDescribedBy>
      <rdf:Bag>
        <rdf:li rdf:resource="urn:miriam:obo.eco:ECO%3A0000313" />
      </rdf:Bag>
    </CopasiMT:isDescribedBy>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <Comment>
          <body xmlns="http://www.w3.org/1999/xhtml">
    <a href="https://www.kegg.jp/dbget-bin/www_bget?C00022:Pyruvate;">Original Kegg Entry</a>
    <br />
  </body>
        </Comment>
      </Metabolite>
      <Metabolite key="Metabolite_8" name="FDP" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_8">
    <CopasiMT:is rdf:resource="urn:miriam:sbo:SBO:0000247" />
    <CopasiMT:isDescribedBy>
      <rdf:Bag>
        <rdf:li rdf:resource="urn:miriam:obo.eco:ECO%3A0000313" />
      </rdf:Bag>
    </CopasiMT:isDescribedBy>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <Comment>
          <body xmlns="http://www.w3.org/1999/xhtml">
    <a href="https://www.kegg.jp/dbget-bin/www_bget?C05378:beta-D-Fructose 1,6-bisphosphate">Original Kegg Entry</a>
    <br />
  </body>
        </Comment>
      </Metabolite>
      <Metabolite key="Metabolite_9" name="GAP" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_9">
    <CopasiMT:is rdf:resource="urn:miriam:sbo:SBO:0000247" />
    <CopasiMT:isDescribedBy>
      <rdf:Bag>
        <rdf:li rdf:resource="urn:miriam:obo.eco:ECO%3A0000313" />
      </rdf:Bag>
    </CopasiMT:isDescribedBy>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <Comment>
          <body xmlns="http://www.w3.org/1999/xhtml">
    <a href="https://www.kegg.jp/dbget-bin/www_bget?C00118:D-Glyceraldehyde 3-phosphate;">Original Kegg Entry</a>
    <br />
  </body>
        </Comment>
      </Metabolite>
      <Metabolite key="Metabolite_10" name="G1P" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_10">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_11" name="Ph" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_11">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_12" name="GLY" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_12">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_13" name="atp" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_13">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_14" name="adp" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_14">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_15" name="NAD" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_15">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_16" name="NADH" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_16">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_17" name="LAC" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_17">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
    </ListOfMetabolites>
    <ListOfReactions>
      <Reaction key="Reaction_0" name="ENO1__enolase_118" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_0">
    <CopasiMT:is rdf:resource="urn:miriam:sbo:SBO:0000176" />
    <CopasiMT:isDescribedBy>
      <rdf:Bag>
        <rdf:li rdf:resource="urn:miriam:obo.eco:ECO%3A0000313" />
      </rdf:Bag>
    </CopasiMT:isDescribedBy>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <Comment>
          <body xmlns="http://www.w3.org/1999/xhtml">
    <p>
      <b>
        <font color="#FF0000">Could not check the atom balance of this reaction.</font>
      </b>
    </p>
  </body>
        </Comment>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_0" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_4" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_5782" name="Vfen" value="0"/>
          <Constant key="Parameter_5785" name="Ken2pg" value="0"/>
          <Constant key="Parameter_5783" name="Kenpep" value="0"/>
        </ListOfConstants>
        <KineticLaw function="Function_51" unitType="Default" scalingCompartment="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_370">
              <SourceParameter reference="Parameter_5782"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_369">
              <SourceParameter reference="Metabolite_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_368">
              <SourceParameter reference="Parameter_5785"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_367">
              <SourceParameter reference="Parameter_5783"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_366">
              <SourceParameter reference="Metabolite_4"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1" name="PGAM4__phosphoglycerate_mutase_family_member_419" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1">
    <CopasiMT:is rdf:resource="urn:miriam:sbo:SBO:0000176"/>
    <CopasiMT:isDescribedBy>
      <rdf:Bag>
        <rdf:li rdf:resource="urn:miriam:obo.eco:ECO%3A0000313"/>
      </rdf:Bag>
    </CopasiMT:isDescribedBy>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <Comment>
          <body xmlns="http://www.w3.org/1999/xhtml">
    <p>
      <b>
        <font color="#FF0000">Could not check the atom balance of this reaction.</font>
      </b>
    </p>
  </body>
        </Comment>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_0" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_5" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_5786" name="Vfpgm" value="0"/>
          <Constant key="Parameter_6394" name="Kpgm3pg" value="0"/>
          <Constant key="Parameter_6391" name="Kpgm2pg" value="0"/>
        </ListOfConstants>
        <KineticLaw function="Function_50" unitType="Default" scalingCompartment="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_365">
              <SourceParameter reference="Parameter_5786"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_364">
              <SourceParameter reference="Metabolite_5"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_363">
              <SourceParameter reference="Parameter_6394"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_356">
              <SourceParameter reference="Parameter_6391"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_357">
              <SourceParameter reference="Metabolite_0"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_2" name="TPI1__triosephosphate_isomerase_121" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_2">
    <CopasiMT:is rdf:resource="urn:miriam:sbo:SBO:0000176"/>
    <CopasiMT:isDescribedBy>
      <rdf:Bag>
        <rdf:li rdf:resource="urn:miriam:obo.eco:ECO%3A0000313"/>
      </rdf:Bag>
    </CopasiMT:isDescribedBy>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <Comment>
          <body xmlns="http://www.w3.org/1999/xhtml">
    <p>
      <b>
        <font color="#FF0000">Could not check the atom balance of this reaction.</font>
      </b>
    </p>
  </body>
        </Comment>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_9" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_6704" name="Vftpi" value="0"/>
          <Constant key="Parameter_6705" name="Ktpigap" value="0"/>
          <Constant key="Parameter_6703" name="Ktpidhap" value="0"/>
        </ListOfConstants>
        <KineticLaw function="Function_49" unitType="Default" scalingCompartment="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_362">
              <SourceParameter reference="Parameter_6704"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_361">
              <SourceParameter reference="Metabolite_9"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_360">
              <SourceParameter reference="Parameter_6705"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_359">
              <SourceParameter reference="Parameter_6703"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_358">
              <SourceParameter reference="Metabolite_1"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_3" name="ALDOA__aldolase,_fructose-bisphosphate_A0" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_3">
    <CopasiMT:is rdf:resource="urn:miriam:sbo:SBO:0000176" />
    <CopasiMT:isDescribedBy>
      <rdf:Bag>
        <rdf:li rdf:resource="urn:miriam:obo.eco:ECO%3A0000313" />
      </rdf:Bag>
    </CopasiMT:isDescribedBy>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <Comment>
          <body xmlns="http://www.w3.org/1999/xhtml">
    <p>
      <b>
        <font color="#FF0000">Could not check the atom balance of this reaction.</font>
      </b>
    </p>
  </body>
        </Comment>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_8" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_9" stoichiometry="1"/>
          <Product metabolite="Metabolite_1" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_6395" name="Vfald" value="0"/>
          <Constant key="Parameter_6392" name="Kaldfdp" value="0"/>
          <Constant key="Parameter_6393" name="Kaldgap" value="0"/>
          <Constant key="Parameter_6701" name="Kalddhap" value="0"/>
        </ListOfConstants>
        <KineticLaw function="Function_48" unitType="Default" scalingCompartment="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_353">
              <SourceParameter reference="Parameter_6395"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_344">
              <SourceParameter reference="Metabolite_8"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_345">
              <SourceParameter reference="Parameter_6392"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_346">
              <SourceParameter reference="Parameter_6393"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_347">
              <SourceParameter reference="Parameter_6701"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_354">
              <SourceParameter reference="Metabolite_9"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_355">
              <SourceParameter reference="Metabolite_1"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_4" name="GPI__glucose-6-phosphate_isomerase25" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_4">
    <CopasiMT:is rdf:resource="urn:miriam:sbo:SBO:0000176"/>
    <CopasiMT:isDescribedBy>
      <rdf:Bag>
        <rdf:li rdf:resource="urn:miriam:obo.eco:ECO%3A0000313"/>
      </rdf:Bag>
    </CopasiMT:isDescribedBy>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <Comment>
          <body xmlns="http://www.w3.org/1999/xhtml">
    <p>
      <b>
        <font color="#FF0000">Could not check the atom balance of this reaction.</font>
      </b>
    </p>
  </body>
        </Comment>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_2" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_3" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_6702" name="Vbpgi" value="0"/>
          <Constant key="Parameter_4442" name="Kpgig6p" value="0"/>
          <Constant key="Parameter_5384" name="Kpgif6p" value="0"/>
        </ListOfConstants>
        <KineticLaw function="Function_47" unitType="Default" scalingCompartment="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_352">
              <SourceParameter reference="Parameter_6702"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_351">
              <SourceParameter reference="Parameter_4442"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_350">
              <SourceParameter reference="Parameter_5384"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_349">
              <SourceParameter reference="Metabolite_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_348">
              <SourceParameter reference="Metabolite_3"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_5" name="v2" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_5">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_10" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_2" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_5387" name="Vfpglm" value="1"/>
          <Constant key="Parameter_5383" name="Kpglmg1p" value="1"/>
          <Constant key="Parameter_5381" name="Kpglmg6p" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_40" unitType="Default" scalingCompartment="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_264">
              <SourceParameter reference="Parameter_5387"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_263">
              <SourceParameter reference="Metabolite_10"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_262">
              <SourceParameter reference="Parameter_5383"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_261">
              <SourceParameter reference="Parameter_5381"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_250">
              <SourceParameter reference="Metabolite_2"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_6" name="v1" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_6">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_11" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_12" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_10" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_5385" name="fracA" value="1"/>
          <Constant key="Parameter_4440" name="Vfgly" value="1"/>
          <Constant key="Parameter_4443" name="KgpAigly" value="1"/>
          <Constant key="Parameter_4439" name="KgpApi" value="1"/>
          <Constant key="Parameter_5386" name="KgpAglyf" value="1"/>
          <Constant key="Parameter_4441" name="KgpAipi" value="1"/>
          <Constant key="Parameter_4203" name="KgpAglyb" value="1"/>
          <Constant key="Parameter_4199" name="KgpAg1p" value="1"/>
          <Constant key="Parameter_5382" name="KgpAig1p" value="1"/>
          <Constant key="Parameter_5081" name="fracB" value="1"/>
          <Constant key="Parameter_6744" name="amp" value="1"/>
          <Constant key="Parameter_4883" name="nH" value="1"/>
          <Constant key="Parameter_4880" name="Kgpamp" value="1"/>
          <Constant key="Parameter_4198" name="KgpBiglyf" value="1"/>
          <Constant key="Parameter_5378" name="KgpBpi" value="1"/>
          <Constant key="Parameter_6742" name="KgpBipi" value="1"/>
          <Constant key="Parameter_4870" name="KgpBiglyb" value="1"/>
          <Constant key="Parameter_5380" name="KgpBig1p" value="1"/>
          <Constant key="Parameter_4873" name="KgpBg1p" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_41" unitType="Default" scalingCompartment="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_269">
              <SourceParameter reference="Parameter_5385"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_268">
              <SourceParameter reference="Parameter_4440"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_267">
              <SourceParameter reference="Metabolite_11"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_266">
              <SourceParameter reference="Metabolite_11"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_265">
              <SourceParameter reference="Parameter_4443"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_270">
              <SourceParameter reference="Parameter_4439"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_271">
              <SourceParameter reference="Parameter_5386"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_272">
              <SourceParameter reference="Parameter_4441"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_273">
              <SourceParameter reference="Parameter_4203"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_274">
              <SourceParameter reference="Metabolite_10"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_275">
              <SourceParameter reference="Parameter_4199"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_276">
              <SourceParameter reference="Parameter_5382"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_277">
              <SourceParameter reference="Parameter_5081"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_278">
              <SourceParameter reference="Parameter_6744"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_279">
              <SourceParameter reference="Parameter_4883"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_280">
              <SourceParameter reference="Parameter_4880"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_281">
              <SourceParameter reference="Parameter_4198"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_282">
              <SourceParameter reference="Parameter_5378"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_283">
              <SourceParameter reference="Parameter_6742"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_284">
              <SourceParameter reference="Parameter_4870"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_285">
              <SourceParameter reference="Parameter_5380"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_286">
              <SourceParameter reference="Parameter_4873"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_7" name="PFKL__phosphofructokinase,_liver_type22" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"/>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_3" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_13" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_14" stoichiometry="1"/>
          <Product metabolite="Metabolite_8" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_6743" name="Vfpfk" value="1"/>
          <Constant key="Parameter_4202" name="Kpfkatp" value="1"/>
          <Constant key="Parameter_6745" name="Kpfkf6p" value="1"/>
          <Constant key="Parameter_4201" name="Lo" value="1"/>
          <Constant key="Parameter_4200" name="en" value="1"/>
          <Constant key="Parameter_4197" name="amp" value="1"/>
          <Constant key="Parameter_4882" name="Kpfkamp" value="1"/>
          <Constant key="Parameter_5379" name="Kpfkiatp" value="1"/>
          <Constant key="Parameter_6741" name="KpfkatpT" value="1"/>
          <Constant key="Parameter_4876" name="Kpfkf6pT" value="1"/>
          <Constant key="Parameter_5084" name="KpfkfdpT" value="1"/>
          <Constant key="Parameter_4881" name="KpfkadpT" value="1"/>
          <Constant key="Parameter_7117" name="dn" value="1"/>
          <Constant key="Parameter_4875" name="Kpfkfdp" value="1"/>
          <Constant key="Parameter_7115" name="Kpfkadp" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_42" unitType="Default" scalingCompartment="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_308">
              <SourceParameter reference="Parameter_6743"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_307">
              <SourceParameter reference="Metabolite_13"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_306">
              <SourceParameter reference="Metabolite_3"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_305">
              <SourceParameter reference="Parameter_4202"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_304">
              <SourceParameter reference="Parameter_6745"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_303">
              <SourceParameter reference="Parameter_4201"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_302">
              <SourceParameter reference="Parameter_4200"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_301">
              <SourceParameter reference="Parameter_4197"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_300">
              <SourceParameter reference="Parameter_4882"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_299">
              <SourceParameter reference="Parameter_5379"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_298">
              <SourceParameter reference="Parameter_6741"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_297">
              <SourceParameter reference="Parameter_4876"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_296">
              <SourceParameter reference="Metabolite_8"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_295">
              <SourceParameter reference="Parameter_5084"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_294">
              <SourceParameter reference="Metabolite_14"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_293">
              <SourceParameter reference="Parameter_4881"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_292">
              <SourceParameter reference="Parameter_7117"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_291">
              <SourceParameter reference="Parameter_4875"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_290">
              <SourceParameter reference="Parameter_7115"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_8" name="GAPDH__glyceraldehyde-3-phosphate_dehydrogenase20" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"/>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_9" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_15" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_11" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_6" stoichiometry="1"/>
          <Product metabolite="Metabolite_16" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_7114" name="Vfgad" value="1"/>
          <Constant key="Parameter_4879" name="Kgapdhgap" value="1"/>
          <Constant key="Parameter_4877" name="Kgapdhnad" value="1"/>
          <Constant key="Parameter_4884" name="Kgapdhpi" value="1"/>
          <Constant key="Parameter_4878" name="Kgapdh13dpg" value="1"/>
          <Constant key="Parameter_7116" name="Kgapdhnadh" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_43" unitType="Default" scalingCompartment="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_324">
              <SourceParameter reference="Parameter_7114"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_323">
              <SourceParameter reference="Metabolite_6"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_322">
              <SourceParameter reference="Metabolite_16"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_321">
              <SourceParameter reference="Parameter_4879"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_320">
              <SourceParameter reference="Parameter_4877"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_319">
              <SourceParameter reference="Parameter_4884"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_318">
              <SourceParameter reference="Metabolite_9"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_317">
              <SourceParameter reference="Metabolite_15"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_316">
              <SourceParameter reference="Metabolite_11"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_315">
              <SourceParameter reference="Parameter_4878"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_314">
              <SourceParameter reference="Parameter_7116"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_9" name="PGK1__phosphoglycerate_kinase_139" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"/>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_5" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_13" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_14" stoichiometry="1"/>
          <Product metabolite="Metabolite_6" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4872" name="Vbpgk" value="1"/>
          <Constant key="Parameter_4874" name="Kpgk3pg" value="1"/>
          <Constant key="Parameter_7113" name="Kpgkatp" value="1"/>
          <Constant key="Parameter_4871" name="Kpgkadp" value="1"/>
          <Constant key="Parameter_5083" name="Kpgk13dpg" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_44" unitType="Default" scalingCompartment="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_327">
              <SourceParameter reference="Parameter_4872"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_326">
              <SourceParameter reference="Metabolite_14"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_325">
              <SourceParameter reference="Metabolite_6"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_289">
              <SourceParameter reference="Parameter_4874"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_288">
              <SourceParameter reference="Parameter_7113"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_287">
              <SourceParameter reference="Metabolite_13"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_309">
              <SourceParameter reference="Metabolite_5"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_310">
              <SourceParameter reference="Parameter_4871"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_311">
              <SourceParameter reference="Parameter_5083"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_10" name="PKLR__pyruvate_kinase_L/R16" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_10">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_4" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_14" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_7" stoichiometry="1"/>
          <Product metabolite="Metabolite_13" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_7658" name="Vfpk" value="1"/>
          <Constant key="Parameter_7655" name="Kpkpep" value="1"/>
          <Constant key="Parameter_5085" name="Kpkadp" value="1"/>
          <Constant key="Parameter_5082" name="Kpkpyr" value="1"/>
          <Constant key="Parameter_7656" name="Kpkatp" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_45" unitType="Default" scalingCompartment="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_334">
              <SourceParameter reference="Parameter_7658"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_333">
              <SourceParameter reference="Metabolite_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_332">
              <SourceParameter reference="Metabolite_14"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_331">
              <SourceParameter reference="Parameter_7655"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_330">
              <SourceParameter reference="Parameter_5085"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_329">
              <SourceParameter reference="Parameter_5082"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_328">
              <SourceParameter reference="Parameter_7656"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_313">
              <SourceParameter reference="Metabolite_7"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_312">
              <SourceParameter reference="Metabolite_13"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_11" name="v12" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_11">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_7" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_16" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_17" stoichiometry="1"/>
          <Product metabolite="Metabolite_15" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4683" name="Vfldh" value="0"/>
          <Constant key="Parameter_4680" name="Kldhpyr" value="0"/>
          <Constant key="Parameter_7659" name="Kldhnadh" value="0"/>
          <Constant key="Parameter_7657" name="Kldhlac" value="0"/>
          <Constant key="Parameter_4684" name="Kldhnad" value="0"/>
        </ListOfConstants>
        <KineticLaw function="Function_46" unitType="Default" scalingCompartment="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_343">
              <SourceParameter reference="Parameter_4683"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_342">
              <SourceParameter reference="Metabolite_7"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_341">
              <SourceParameter reference="Metabolite_16"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_340">
              <SourceParameter reference="Parameter_4680"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_339">
              <SourceParameter reference="Parameter_7659"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_338">
              <SourceParameter reference="Parameter_7657"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_337">
              <SourceParameter reference="Parameter_4684"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_336">
              <SourceParameter reference="Metabolite_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_335">
              <SourceParameter reference="Metabolite_15"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
    </ListOfReactions>
    <ListOfModelParameterSets activeSet="ModelParameterSet_0">
      <ModelParameterSet key="ModelParameterSet_0" name="Initial State">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelParameterSet_0">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Compartments[default]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Compartments[default],Vector=Metabolites[P2G]" value="6.0221417899999999e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Compartments[default],Vector=Metabolites[DHAP]" value="6.0221417899999999e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Compartments[default],Vector=Metabolites[G6P]" value="6.0221417899999999e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Compartments[default],Vector=Metabolites[F6P]" value="6.0221417899999999e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Compartments[default],Vector=Metabolites[PEP]" value="6.0221417899999999e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Compartments[default],Vector=Metabolites[P3G]" value="6.0221417899999999e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Compartments[default],Vector=Metabolites[DPG]" value="6.0221417899999999e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Compartments[default],Vector=Metabolites[PYR]" value="6.0221417899999999e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Compartments[default],Vector=Metabolites[FDP]" value="6.0221417899999999e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Compartments[default],Vector=Metabolites[GAP]" value="6.0221417899999999e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Compartments[default],Vector=Metabolites[G1P]" value="6.0221417899999999e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Compartments[default],Vector=Metabolites[Ph]" value="6.0221417899999999e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Compartments[default],Vector=Metabolites[GLY]" value="6.0221417899999999e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Compartments[default],Vector=Metabolites[atp]" value="6.0221417899999999e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Compartments[default],Vector=Metabolites[adp]" value="6.0221417899999999e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Compartments[default],Vector=Metabolites[NAD]" value="6.0221417899999999e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Compartments[default],Vector=Metabolites[NADH]" value="6.0221417899999999e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Compartments[default],Vector=Metabolites[LAC]" value="6.0221417899999999e+23" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[ENO1__enolase_118]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[ENO1__enolase_118],ParameterGroup=Parameters,Parameter=Vfen" value="0" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[ENO1__enolase_118],ParameterGroup=Parameters,Parameter=Ken2pg" value="0" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[ENO1__enolase_118],ParameterGroup=Parameters,Parameter=Kenpep" value="0" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[PGAM4__phosphoglycerate_mutase_family_member_419]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[PGAM4__phosphoglycerate_mutase_family_member_419],ParameterGroup=Parameters,Parameter=Vfpgm" value="0" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[PGAM4__phosphoglycerate_mutase_family_member_419],ParameterGroup=Parameters,Parameter=Kpgm3pg" value="0" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[PGAM4__phosphoglycerate_mutase_family_member_419],ParameterGroup=Parameters,Parameter=Kpgm2pg" value="0" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[TPI1__triosephosphate_isomerase_121]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[TPI1__triosephosphate_isomerase_121],ParameterGroup=Parameters,Parameter=Vftpi" value="0" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[TPI1__triosephosphate_isomerase_121],ParameterGroup=Parameters,Parameter=Ktpigap" value="0" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[TPI1__triosephosphate_isomerase_121],ParameterGroup=Parameters,Parameter=Ktpidhap" value="0" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[ALDOA__aldolase\,_fructose-bisphosphate_A0]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[ALDOA__aldolase\,_fructose-bisphosphate_A0],ParameterGroup=Parameters,Parameter=Vfald" value="0" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[ALDOA__aldolase\,_fructose-bisphosphate_A0],ParameterGroup=Parameters,Parameter=Kaldfdp" value="0" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[ALDOA__aldolase\,_fructose-bisphosphate_A0],ParameterGroup=Parameters,Parameter=Kaldgap" value="0" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[ALDOA__aldolase\,_fructose-bisphosphate_A0],ParameterGroup=Parameters,Parameter=Kalddhap" value="0" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[GPI__glucose-6-phosphate_isomerase25]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[GPI__glucose-6-phosphate_isomerase25],ParameterGroup=Parameters,Parameter=Vbpgi" value="0" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[GPI__glucose-6-phosphate_isomerase25],ParameterGroup=Parameters,Parameter=Kpgig6p" value="0" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[GPI__glucose-6-phosphate_isomerase25],ParameterGroup=Parameters,Parameter=Kpgif6p" value="0" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[v2]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[v2],ParameterGroup=Parameters,Parameter=Vfpglm" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[v2],ParameterGroup=Parameters,Parameter=Kpglmg1p" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[v2],ParameterGroup=Parameters,Parameter=Kpglmg6p" value="1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[v1]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[v1],ParameterGroup=Parameters,Parameter=fracA" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[v1],ParameterGroup=Parameters,Parameter=Vfgly" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[v1],ParameterGroup=Parameters,Parameter=KgpAigly" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[v1],ParameterGroup=Parameters,Parameter=KgpApi" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[v1],ParameterGroup=Parameters,Parameter=KgpAglyf" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[v1],ParameterGroup=Parameters,Parameter=KgpAipi" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[v1],ParameterGroup=Parameters,Parameter=KgpAglyb" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[v1],ParameterGroup=Parameters,Parameter=KgpAg1p" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[v1],ParameterGroup=Parameters,Parameter=KgpAig1p" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[v1],ParameterGroup=Parameters,Parameter=fracB" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[v1],ParameterGroup=Parameters,Parameter=amp" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[v1],ParameterGroup=Parameters,Parameter=nH" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[v1],ParameterGroup=Parameters,Parameter=Kgpamp" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[v1],ParameterGroup=Parameters,Parameter=KgpBiglyf" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[v1],ParameterGroup=Parameters,Parameter=KgpBpi" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[v1],ParameterGroup=Parameters,Parameter=KgpBipi" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[v1],ParameterGroup=Parameters,Parameter=KgpBiglyb" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[v1],ParameterGroup=Parameters,Parameter=KgpBig1p" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[v1],ParameterGroup=Parameters,Parameter=KgpBg1p" value="1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[PFKL__phosphofructokinase\,_liver_type22]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[PFKL__phosphofructokinase\,_liver_type22],ParameterGroup=Parameters,Parameter=Vfpfk" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[PFKL__phosphofructokinase\,_liver_type22],ParameterGroup=Parameters,Parameter=Kpfkatp" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[PFKL__phosphofructokinase\,_liver_type22],ParameterGroup=Parameters,Parameter=Kpfkf6p" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[PFKL__phosphofructokinase\,_liver_type22],ParameterGroup=Parameters,Parameter=Lo" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[PFKL__phosphofructokinase\,_liver_type22],ParameterGroup=Parameters,Parameter=en" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[PFKL__phosphofructokinase\,_liver_type22],ParameterGroup=Parameters,Parameter=amp" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[PFKL__phosphofructokinase\,_liver_type22],ParameterGroup=Parameters,Parameter=Kpfkamp" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[PFKL__phosphofructokinase\,_liver_type22],ParameterGroup=Parameters,Parameter=Kpfkiatp" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[PFKL__phosphofructokinase\,_liver_type22],ParameterGroup=Parameters,Parameter=KpfkatpT" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[PFKL__phosphofructokinase\,_liver_type22],ParameterGroup=Parameters,Parameter=Kpfkf6pT" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[PFKL__phosphofructokinase\,_liver_type22],ParameterGroup=Parameters,Parameter=KpfkfdpT" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[PFKL__phosphofructokinase\,_liver_type22],ParameterGroup=Parameters,Parameter=KpfkadpT" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[PFKL__phosphofructokinase\,_liver_type22],ParameterGroup=Parameters,Parameter=dn" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[PFKL__phosphofructokinase\,_liver_type22],ParameterGroup=Parameters,Parameter=Kpfkfdp" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[PFKL__phosphofructokinase\,_liver_type22],ParameterGroup=Parameters,Parameter=Kpfkadp" value="1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[GAPDH__glyceraldehyde-3-phosphate_dehydrogenase20]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[GAPDH__glyceraldehyde-3-phosphate_dehydrogenase20],ParameterGroup=Parameters,Parameter=Vfgad" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[GAPDH__glyceraldehyde-3-phosphate_dehydrogenase20],ParameterGroup=Parameters,Parameter=Kgapdhgap" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[GAPDH__glyceraldehyde-3-phosphate_dehydrogenase20],ParameterGroup=Parameters,Parameter=Kgapdhnad" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[GAPDH__glyceraldehyde-3-phosphate_dehydrogenase20],ParameterGroup=Parameters,Parameter=Kgapdhpi" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[GAPDH__glyceraldehyde-3-phosphate_dehydrogenase20],ParameterGroup=Parameters,Parameter=Kgapdh13dpg" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[GAPDH__glyceraldehyde-3-phosphate_dehydrogenase20],ParameterGroup=Parameters,Parameter=Kgapdhnadh" value="1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[PGK1__phosphoglycerate_kinase_139]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[PGK1__phosphoglycerate_kinase_139],ParameterGroup=Parameters,Parameter=Vbpgk" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[PGK1__phosphoglycerate_kinase_139],ParameterGroup=Parameters,Parameter=Kpgk3pg" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[PGK1__phosphoglycerate_kinase_139],ParameterGroup=Parameters,Parameter=Kpgkatp" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[PGK1__phosphoglycerate_kinase_139],ParameterGroup=Parameters,Parameter=Kpgkadp" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[PGK1__phosphoglycerate_kinase_139],ParameterGroup=Parameters,Parameter=Kpgk13dpg" value="1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[PKLR__pyruvate_kinase_L/R16]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[PKLR__pyruvate_kinase_L/R16],ParameterGroup=Parameters,Parameter=Vfpk" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[PKLR__pyruvate_kinase_L/R16],ParameterGroup=Parameters,Parameter=Kpkpep" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[PKLR__pyruvate_kinase_L/R16],ParameterGroup=Parameters,Parameter=Kpkadp" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[PKLR__pyruvate_kinase_L/R16],ParameterGroup=Parameters,Parameter=Kpkpyr" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[PKLR__pyruvate_kinase_L/R16],ParameterGroup=Parameters,Parameter=Kpkatp" value="1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[v12]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[v12],ParameterGroup=Parameters,Parameter=Vfldh" value="0" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[v12],ParameterGroup=Parameters,Parameter=Kldhpyr" value="0" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[v12],ParameterGroup=Parameters,Parameter=Kldhnadh" value="0" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[v12],ParameterGroup=Parameters,Parameter=Kldhlac" value="0" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Glycolysis / Gluconeogenesis,Vector=Reactions[v12],ParameterGroup=Parameters,Parameter=Kldhnad" value="0" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
    </ListOfModelParameterSets>
    <StateTemplate>
      <StateTemplateVariable objectReference="Model_0"/>
      <StateTemplateVariable objectReference="Metabolite_9"/>
      <StateTemplateVariable objectReference="Metabolite_13"/>
      <StateTemplateVariable objectReference="Metabolite_2"/>
      <StateTemplateVariable objectReference="Metabolite_0"/>
      <StateTemplateVariable objectReference="Metabolite_1"/>
      <StateTemplateVariable objectReference="Metabolite_7"/>
      <StateTemplateVariable objectReference="Metabolite_11"/>
      <StateTemplateVariable objectReference="Metabolite_3"/>
      <StateTemplateVariable objectReference="Metabolite_5"/>
      <StateTemplateVariable objectReference="Metabolite_4"/>
      <StateTemplateVariable objectReference="Metabolite_10"/>
      <StateTemplateVariable objectReference="Metabolite_6"/>
      <StateTemplateVariable objectReference="Metabolite_12"/>
      <StateTemplateVariable objectReference="Metabolite_8"/>
      <StateTemplateVariable objectReference="Metabolite_14"/>
      <StateTemplateVariable objectReference="Metabolite_15"/>
      <StateTemplateVariable objectReference="Metabolite_16"/>
      <StateTemplateVariable objectReference="Metabolite_17"/>
      <StateTemplateVariable objectReference="Compartment_0"/>
    </StateTemplate>
    <InitialState type="initialState">
      0 6.0221417899999999e+23 6.0221417899999999e+23 6.0221417899999999e+23 6.0221417899999999e+23 6.0221417899999999e+23 6.0221417899999999e+23 6.0221417899999999e+23 6.0221417899999999e+23 6.0221417899999999e+23 6.0221417899999999e+23 6.0221417899999999e+23 6.0221417899999999e+23 6.0221417899999999e+23 6.0221417899999999e+23 6.0221417899999999e+23 6.0221417899999999e+23 6.0221417899999999e+23 6.0221417899999999e+23 1 
    </InitialState>
  </Model>
  <ListOfTasks>
    <Task key="Task_13" name="Steady-State" type="steadyState" scheduled="false" updateModel="false">
      <Report reference="Report_10" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="JacobianRequested" type="bool" value="1"/>
        <Parameter name="StabilityAnalysisRequested" type="bool" value="1"/>
      </Problem>
      <Method name="Enhanced Newton" type="EnhancedNewton">
        <Parameter name="Resolution" type="unsignedFloat" value="1.0000000000000001e-09"/>
        <Parameter name="Derivation Factor" type="unsignedFloat" value="0.001"/>
        <Parameter name="Use Newton" type="bool" value="1"/>
        <Parameter name="Use Integration" type="bool" value="1"/>
        <Parameter name="Use Back Integration" type="bool" value="0"/>
        <Parameter name="Accept Negative Concentrations" type="bool" value="0"/>
        <Parameter name="Iteration Limit" type="unsignedInteger" value="50"/>
        <Parameter name="Maximum duration for forward integration" type="unsignedFloat" value="1000000000"/>
        <Parameter name="Maximum duration for backward integration" type="unsignedFloat" value="1000000"/>
        <Parameter name="Target Criterion" type="string" value="Distance and Rate"/>
      </Method>
    </Task>
    <Task key="Task_12" name="Time-Course" type="timeCourse" scheduled="false" updateModel="false">
      <Report reference="Report_9" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="AutomaticStepSize" type="bool" value="0"/>
        <Parameter name="StepNumber" type="unsignedInteger" value="100"/>
        <Parameter name="StepSize" type="float" value="0.01"/>
        <Parameter name="Duration" type="float" value="1"/>
        <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
        <Parameter name="OutputStartTime" type="float" value="0"/>
        <Parameter name="Output Event" type="bool" value="0"/>
        <Parameter name="Start in Steady State" type="bool" value="0"/>
        <Parameter name="Use Values" type="bool" value="0"/>
        <Parameter name="Values" type="string" value=""/>
      </Problem>
      <Method name="Deterministic (LSODA)" type="Deterministic(LSODA)">
        <Parameter name="Integrate Reduced Model" type="bool" value="0"/>
        <Parameter name="Relative Tolerance" type="unsignedFloat" value="9.9999999999999995e-07"/>
        <Parameter name="Absolute Tolerance" type="unsignedFloat" value="9.9999999999999998e-13"/>
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="100000"/>
        <Parameter name="Max Internal Step Size" type="unsignedFloat" value="0"/>
      </Method>
    </Task>
    <Task key="Task_11" name="Scan" type="scan" scheduled="false" updateModel="false">
      <Problem>
        <Parameter name="Subtask" type="unsignedInteger" value="1"/>
        <ParameterGroup name="ScanItems">
        </ParameterGroup>
        <Parameter name="Output in subtask" type="bool" value="1"/>
        <Parameter name="Adjust initial conditions" type="bool" value="0"/>
        <Parameter name="Continue on Error" type="bool" value="0"/>
      </Problem>
      <Method name="Scan Framework" type="ScanFramework">
      </Method>
    </Task>
    <Task key="Task_10" name="Elementary Flux Modes" type="fluxMode" scheduled="false" updateModel="false">
      <Report reference="Report_8" target="" append="1" confirmOverwrite="1"/>
      <Problem>
      </Problem>
      <Method name="EFM Algorithm" type="EFMAlgorithm">
      </Method>
    </Task>
    <Task key="Task_9" name="Optimization" type="optimization" scheduled="false" updateModel="false">
      <Report reference="Report_7" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Subtask" type="cn" value="CN=Root,Vector=TaskList[Steady-State]"/>
        <ParameterText name="ObjectiveExpression" type="expression">
          
        </ParameterText>
        <Parameter name="Maximize" type="bool" value="0"/>
        <Parameter name="Randomize Start Values" type="bool" value="0"/>
        <Parameter name="Calculate Statistics" type="bool" value="1"/>
        <ParameterGroup name="OptimizationItemList">
        </ParameterGroup>
        <ParameterGroup name="OptimizationConstraintList">
        </ParameterGroup>
      </Problem>
      <Method name="Random Search" type="RandomSearch">
        <Parameter name="Log Verbosity" type="unsignedInteger" value="0"/>
        <Parameter name="Number of Iterations" type="unsignedInteger" value="100000"/>
        <Parameter name="Random Number Generator" type="unsignedInteger" value="1"/>
        <Parameter name="Seed" type="unsignedInteger" value="0"/>
      </Method>
    </Task>
    <Task key="Task_8" name="Parameter Estimation" type="parameterFitting" scheduled="false" updateModel="false">
      <Report reference="Report_6" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Maximize" type="bool" value="0"/>
        <Parameter name="Randomize Start Values" type="bool" value="0"/>
        <Parameter name="Calculate Statistics" type="bool" value="1"/>
        <ParameterGroup name="OptimizationItemList">
        </ParameterGroup>
        <ParameterGroup name="OptimizationConstraintList">
        </ParameterGroup>
        <Parameter name="Steady-State" type="cn" value="CN=Root,Vector=TaskList[Steady-State]"/>
        <Parameter name="Time-Course" type="cn" value="CN=Root,Vector=TaskList[Time-Course]"/>
        <Parameter name="Create Parameter Sets" type="bool" value="0"/>
        <Parameter name="Use Time Sens" type="bool" value="0"/>
        <Parameter name="Time-Sens" type="cn" value=""/>
        <ParameterGroup name="Experiment Set">
        </ParameterGroup>
        <ParameterGroup name="Validation Set">
          <Parameter name="Weight" type="unsignedFloat" value="1"/>
          <Parameter name="Threshold" type="unsignedInteger" value="5"/>
        </ParameterGroup>
      </Problem>
      <Method name="Evolutionary Programming" type="EvolutionaryProgram">
        <Parameter name="Log Verbosity" type="unsignedInteger" value="0"/>
        <Parameter name="Number of Generations" type="unsignedInteger" value="200"/>
        <Parameter name="Population Size" type="unsignedInteger" value="20"/>
        <Parameter name="Random Number Generator" type="unsignedInteger" value="1"/>
        <Parameter name="Seed" type="unsignedInteger" value="0"/>
        <Parameter name="Stop after # Stalled Generations" type="unsignedInteger" value="0"/>
      </Method>
    </Task>
    <Task key="Task_7" name="Metabolic Control Analysis" type="metabolicControlAnalysis" scheduled="false" updateModel="false">
      <Report reference="Report_5" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Steady-State" type="key" value="Task_13"/>
      </Problem>
      <Method name="MCA Method (Reder)" type="MCAMethod(Reder)">
        <Parameter name="Modulation Factor" type="unsignedFloat" value="1.0000000000000001e-09"/>
        <Parameter name="Use Reder" type="bool" value="1"/>
        <Parameter name="Use Smallbone" type="bool" value="1"/>
      </Method>
    </Task>
    <Task key="Task_6" name="Lyapunov Exponents" type="lyapunovExponents" scheduled="false" updateModel="false">
      <Report reference="Report_4" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="ExponentNumber" type="unsignedInteger" value="3"/>
        <Parameter name="DivergenceRequested" type="bool" value="1"/>
        <Parameter name="TransientTime" type="float" value="0"/>
      </Problem>
      <Method name="Wolf Method" type="WolfMethod">
        <Parameter name="Orthonormalization Interval" type="unsignedFloat" value="1"/>
        <Parameter name="Overall time" type="unsignedFloat" value="1000"/>
        <Parameter name="Relative Tolerance" type="unsignedFloat" value="9.9999999999999995e-07"/>
        <Parameter name="Absolute Tolerance" type="unsignedFloat" value="9.9999999999999998e-13"/>
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="10000"/>
      </Method>
    </Task>
    <Task key="Task_5" name="Time Scale Separation Analysis" type="timeScaleSeparationAnalysis" scheduled="false" updateModel="false">
      <Report reference="Report_3" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="StepNumber" type="unsignedInteger" value="100"/>
        <Parameter name="StepSize" type="float" value="0.01"/>
        <Parameter name="Duration" type="float" value="1"/>
        <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
        <Parameter name="OutputStartTime" type="float" value="0"/>
      </Problem>
      <Method name="ILDM (LSODA,Deuflhard)" type="TimeScaleSeparation(ILDM,Deuflhard)">
        <Parameter name="Deuflhard Tolerance" type="unsignedFloat" value="0.0001"/>
      </Method>
    </Task>
    <Task key="Task_16" name="Sensitivities" type="sensitivities" scheduled="false" updateModel="false">
      <Report reference="Report_2" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="SubtaskType" type="unsignedInteger" value="1"/>
        <ParameterGroup name="TargetFunctions">
          <Parameter name="SingleObject" type="cn" value=""/>
          <Parameter name="ObjectListType" type="unsignedInteger" value="7"/>
        </ParameterGroup>
        <ParameterGroup name="ListOfVariables">
          <ParameterGroup name="Variables">
            <Parameter name="SingleObject" type="cn" value=""/>
            <Parameter name="ObjectListType" type="unsignedInteger" value="41"/>
          </ParameterGroup>
          <ParameterGroup name="Variables">
            <Parameter name="SingleObject" type="cn" value=""/>
            <Parameter name="ObjectListType" type="unsignedInteger" value="0"/>
          </ParameterGroup>
        </ParameterGroup>
      </Problem>
      <Method name="Sensitivities Method" type="SensitivitiesMethod">
        <Parameter name="Delta factor" type="unsignedFloat" value="0.001"/>
        <Parameter name="Delta minimum" type="unsignedFloat" value="9.9999999999999998e-13"/>
      </Method>
    </Task>
    <Task key="Task_15" name="Moieties" type="moieties" scheduled="false" updateModel="false">
      <Report reference="Report_1" target="" append="1" confirmOverwrite="1"/>
      <Problem>
      </Problem>
      <Method name="Householder Reduction" type="Householder">
      </Method>
    </Task>
    <Task key="Task_4" name="Cross Section" type="crosssection" scheduled="false" updateModel="false">
      <Problem>
        <Parameter name="AutomaticStepSize" type="bool" value="0"/>
        <Parameter name="StepNumber" type="unsignedInteger" value="100"/>
        <Parameter name="StepSize" type="float" value="0.01"/>
        <Parameter name="Duration" type="float" value="1"/>
        <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
        <Parameter name="OutputStartTime" type="float" value="0"/>
        <Parameter name="Output Event" type="bool" value="0"/>
        <Parameter name="Start in Steady State" type="bool" value="0"/>
        <Parameter name="Use Values" type="bool" value="0"/>
        <Parameter name="Values" type="string" value=""/>
        <Parameter name="LimitCrossings" type="bool" value="0"/>
        <Parameter name="NumCrossingsLimit" type="unsignedInteger" value="0"/>
        <Parameter name="LimitOutTime" type="bool" value="0"/>
        <Parameter name="LimitOutCrossings" type="bool" value="0"/>
        <Parameter name="PositiveDirection" type="bool" value="1"/>
        <Parameter name="NumOutCrossingsLimit" type="unsignedInteger" value="0"/>
        <Parameter name="LimitUntilConvergence" type="bool" value="0"/>
        <Parameter name="ConvergenceTolerance" type="float" value="9.9999999999999995e-07"/>
        <Parameter name="Threshold" type="float" value="0"/>
        <Parameter name="DelayOutputUntilConvergence" type="bool" value="0"/>
        <Parameter name="OutputConvergenceTolerance" type="float" value="9.9999999999999995e-07"/>
        <ParameterText name="TriggerExpression" type="expression">
          
        </ParameterText>
        <Parameter name="SingleVariable" type="cn" value=""/>
      </Problem>
      <Method name="Deterministic (LSODA)" type="Deterministic(LSODA)">
        <Parameter name="Integrate Reduced Model" type="bool" value="0"/>
        <Parameter name="Relative Tolerance" type="unsignedFloat" value="9.9999999999999995e-07"/>
        <Parameter name="Absolute Tolerance" type="unsignedFloat" value="9.9999999999999998e-13"/>
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="100000"/>
        <Parameter name="Max Internal Step Size" type="unsignedFloat" value="0"/>
      </Method>
    </Task>
    <Task key="Task_3" name="Linear Noise Approximation" type="linearNoiseApproximation" scheduled="false" updateModel="false">
      <Report reference="Report_0" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Steady-State" type="key" value="Task_13"/>
      </Problem>
      <Method name="Linear Noise Approximation" type="LinearNoiseApproximation">
      </Method>
    </Task>
    <Task key="Task_2" name="Time-Course Sensitivities" type="timeSensitivities" scheduled="false" updateModel="false">
      <Problem>
        <Parameter name="AutomaticStepSize" type="bool" value="0"/>
        <Parameter name="StepNumber" type="unsignedInteger" value="100"/>
        <Parameter name="StepSize" type="float" value="0.01"/>
        <Parameter name="Duration" type="float" value="1"/>
        <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
        <Parameter name="OutputStartTime" type="float" value="0"/>
        <Parameter name="Output Event" type="bool" value="0"/>
        <Parameter name="Start in Steady State" type="bool" value="0"/>
        <Parameter name="Use Values" type="bool" value="0"/>
        <Parameter name="Values" type="string" value=""/>
        <ParameterGroup name="ListOfParameters">
        </ParameterGroup>
        <ParameterGroup name="ListOfTargets">
        </ParameterGroup>
      </Problem>
      <Method name="LSODA Sensitivities" type="Sensitivities(LSODA)">
        <Parameter name="Integrate Reduced Model" type="bool" value="0"/>
        <Parameter name="Relative Tolerance" type="unsignedFloat" value="9.9999999999999995e-07"/>
        <Parameter name="Absolute Tolerance" type="unsignedFloat" value="9.9999999999999998e-13"/>
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="10000"/>
        <Parameter name="Max Internal Step Size" type="unsignedFloat" value="0"/>
      </Method>
    </Task>
  </ListOfTasks>
  <ListOfReports>
    <Report key="Report_10" name="Steady-State" taskType="steadyState" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Footer>
        <Object cn="CN=Root,Vector=TaskList[Steady-State]"/>
      </Footer>
    </Report>
    <Report key="Report_9" name="Time-Course" taskType="timeCourse" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Time-Course],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="CN=Root,Vector=TaskList[Time-Course],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_8" name="Elementary Flux Modes" taskType="fluxMode" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Footer>
        <Object cn="CN=Root,Vector=TaskList[Elementary Flux Modes],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_7" name="Optimization" taskType="optimization" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Object=Description"/>
        <Object cn="String=\[Function Evaluations\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Value\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Parameters\]"/>
      </Header>
      <Body>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Problem=Optimization,Reference=Function Evaluations"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Problem=Optimization,Reference=Best Value"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Problem=Optimization,Reference=Best Parameters"/>
      </Body>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_6" name="Parameter Estimation" taskType="parameterFitting" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Object=Description"/>
        <Object cn="String=\[Function Evaluations\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Value\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Parameters\]"/>
      </Header>
      <Body>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,Reference=Function Evaluations"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,Reference=Best Value"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,Reference=Best Parameters"/>
      </Body>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_5" name="Metabolic Control Analysis" taskType="metabolicControlAnalysis" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Metabolic Control Analysis],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Metabolic Control Analysis],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_4" name="Lyapunov Exponents" taskType="lyapunovExponents" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Lyapunov Exponents],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Lyapunov Exponents],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_3" name="Time Scale Separation Analysis" taskType="timeScaleSeparationAnalysis" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Time Scale Separation Analysis],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Time Scale Separation Analysis],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_2" name="Sensitivities" taskType="sensitivities" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Sensitivities],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Sensitivities],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_1" name="Moieties" taskType="moieties" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Moieties],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Moieties],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_0" name="Linear Noise Approximation" taskType="linearNoiseApproximation" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Linear Noise Approximation],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Linear Noise Approximation],Object=Result"/>
      </Footer>
    </Report>
  </ListOfReports>
  <GUI>
  </GUI>
  <ListOfLayouts xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <Layout key="Layout_2" name="Translated metabolic layout.">
      <Dimensions width="781" height="1109"/>
      <ListOfMetabGlyphs>
        <MetaboliteGlyph key="Layout_3" name="glyph_C00033Acetate_1" metabolite="">
          <BoundingBox>
            <Position x="146" y="958"/>
            <Dimensions width="8" height="8"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_4" name="glyph_C00103DGlucose_1phosphate_1" metabolite="">
          <BoundingBox>
            <Position x="483" y="143"/>
            <Dimensions width="8" height="8"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_5" name="glyph_C006312PhosphoDglycerate_1" metabolite="Metabolite_0">
          <BoundingBox>
            <Position x="483" y="664"/>
            <Dimensions width="8" height="8"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_6" name="glyph_C00267alphaDGlucose_1" metabolite="">
          <BoundingBox>
            <Position x="181" y="228"/>
            <Dimensions width="8" height="8"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_7" name="glyph_C00221betaDGlucose_1" metabolite="">
          <BoundingBox>
            <Position x="181" y="301"/>
            <Dimensions width="8" height="8"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_8" name="glyph_C00111Glycerone_phosphate_1" metabolite="Metabolite_1">
          <BoundingBox>
            <Position x="332" y="448"/>
            <Dimensions width="8" height="8"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_9" name="glyph_C01172betaDGlucose_6phosphate_1" metabolite="">
          <BoundingBox>
            <Position x="332" y="301"/>
            <Dimensions width="8" height="8"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_10" name="glyph_C00668alphaDGlucose_6phosphate_1" metabolite="Metabolite_2">
          <BoundingBox>
            <Position x="483" y="230"/>
            <Dimensions width="8" height="8"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_11" name="glyph_C05345betaDFructose_6phosphate_1" metabolite="Metabolite_3">
          <BoundingBox>
            <Position x="483" y="303"/>
            <Dimensions width="8" height="8"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_12" name="glyph_C00074Phosphoenolpyruvate_1" metabolite="Metabolite_4">
          <BoundingBox>
            <Position x="483" y="736"/>
            <Dimensions width="8" height="8"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_13" name="glyph_C001973PhosphoDglycerate_1" metabolite="Metabolite_5">
          <BoundingBox>
            <Position x="483" y="592"/>
            <Dimensions width="8" height="8"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_14" name="glyph_C002363PhosphoDglyceroyl_phosphate_1" metabolite="Metabolite_6">
          <BoundingBox>
            <Position x="483" y="520"/>
            <Dimensions width="8" height="8"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_15" name="glyph_C00186SLactate_1" metabolite="">
          <BoundingBox>
            <Position x="627" y="868"/>
            <Dimensions width="8" height="8"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_16" name="glyph_C15972Enzyme_N6lipoyllysine_1" metabolite="">
          <BoundingBox>
            <Position x="314" y="911"/>
            <Dimensions width="8" height="8"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_17" name="glyph_C00469Ethanol_1" metabolite="">
          <BoundingBox>
            <Position x="550" y="958"/>
            <Dimensions width="8" height="8"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_18" name="glyph_C00022Pyruvate_1" metabolite="Metabolite_7">
          <BoundingBox>
            <Position x="483" y="868"/>
            <Dimensions width="8" height="8"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_19" name="glyph_C051252alphaHydroxyethylthiamine_diphosphate_1" metabolite="">
          <BoundingBox>
            <Position x="378" y="868"/>
            <Dimensions width="8" height="8"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_20" name="glyph_C00024AcetylCoA_1" metabolite="">
          <BoundingBox>
            <Position x="146" y="868"/>
            <Dimensions width="8" height="8"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_21" name="glyph_C00084Acetaldehyde_1" metabolite="">
          <BoundingBox>
            <Position x="378" y="958"/>
            <Dimensions width="8" height="8"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_22" name="glyph_C16255Dihydrolipoyllysineresidue_acetyltransferase_Sacetyldihydrolipoyllysine_1" metabolite="">
          <BoundingBox>
            <Position x="265" y="868"/>
            <Dimensions width="8" height="8"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_23" name="glyph_C15973Enzyme_N6dihydrolipoyllysine_1" metabolite="">
          <BoundingBox>
            <Position x="212" y="911"/>
            <Dimensions width="8" height="8"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_24" name="glyph_C05378betaDFructose_16bisphosphate_1" metabolite="Metabolite_8">
          <BoundingBox>
            <Position x="483" y="373"/>
            <Dimensions width="8" height="8"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_25" name="glyph_C00036Oxaloacetate_1" metabolite="">
          <BoundingBox>
            <Position x="146" y="736"/>
            <Dimensions width="8" height="8"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_26" name="glyph_C0115923BisphosphoDglycerate_1" metabolite="">
          <BoundingBox>
            <Position x="568" y="556"/>
            <Dimensions width="8" height="8"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_27" name="glyph_C00118DGlyceraldehyde_3phosphate_1" metabolite="Metabolite_9">
          <BoundingBox>
            <Position x="483" y="448"/>
            <Dimensions width="8" height="8"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_28" name="glyph_C00068Thiamin_diphosphate_1" metabolite="">
          <BoundingBox>
            <Position x="378" y="825"/>
            <Dimensions width="8" height="8"/>
          </BoundingBox>
        </MetaboliteGlyph>
      </ListOfMetabGlyphs>
      <ListOfReactionGlyphs>
        <ReactionGlyph key="Layout_29" name="glyph_ALDH2__aldehyde_dehydrogenase_2_family_member1_1">
          <Curve>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_30" name="glyph_C00033Acetate_5" metaboliteGlyph="Layout_3" role="product">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_31" name="glyph_C00084Acetaldehyde_6" metaboliteGlyph="Layout_21" role="substrate">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_32" name="glyph_ALDH3A1__aldehyde_dehydrogenase_3_family_member_A13_1">
          <Curve>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_33" name="glyph_C00033Acetate_4" metaboliteGlyph="Layout_3" role="product">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_34" name="glyph_C00084Acetaldehyde_3" metaboliteGlyph="Layout_21" role="substrate">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_35" name="glyph_AKR1A1__aldoketo_reductase_family_1_member_A18_1">
          <Curve>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_36" name="glyph_C00469Ethanol_3" metaboliteGlyph="Layout_17" role="substrate">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_37" name="glyph_C00084Acetaldehyde_4" metaboliteGlyph="Layout_21" role="product">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_38" name="glyph_ADH1A__alcohol_dehydrogenase_1A_class_I_alpha_polypeptide9_1">
          <Curve>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_39" name="glyph_C00469Ethanol_4" metaboliteGlyph="Layout_17" role="substrate">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_40" name="glyph_C00084Acetaldehyde_5" metaboliteGlyph="Layout_21" role="product">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_41" name="glyph_PDHA1__pyruvate_dehydrogenase_E1_subunit_alpha_111_1">
          <Curve>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_42" name="glyph_C00022Pyruvate_5" metaboliteGlyph="Layout_18" role="substrate">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_43" name="glyph_C051252alphaHydroxyethylthiamine_diphosphate_4" metaboliteGlyph="Layout_19" role="product">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_44" name="glyph_C00068Thiamin_diphosphate_4" metaboliteGlyph="Layout_28" role="substrate">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_45" name="glyph_PDHA1__pyruvate_dehydrogenase_E1_subunit_alpha_112_1">
          <Curve>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_46" name="glyph_C15972Enzyme_N6lipoyllysine_3" metaboliteGlyph="Layout_16" role="substrate">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_47" name="glyph_C051252alphaHydroxyethylthiamine_diphosphate_3" metaboliteGlyph="Layout_19" role="substrate">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_48" name="glyph_C16255Dihydrolipoyllysineresidue_acetyltransferase_Sacetyldihydrolipoyllysine_3" metaboliteGlyph="Layout_22" role="product">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_49" name="glyph_C00068Thiamin_diphosphate_3" metaboliteGlyph="Layout_28" role="product">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_50" name="glyph_DLAT__dihydrolipoamide_Sacetyltransferase13_1">
          <Curve>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_51" name="glyph_C00024AcetylCoA_4" metaboliteGlyph="Layout_20" role="substrate">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_52" name="glyph_C16255Dihydrolipoyllysineresidue_acetyltransferase_Sacetyldihydrolipoyllysine_4" metaboliteGlyph="Layout_22" role="product">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_53" name="glyph_C15973Enzyme_N6dihydrolipoyllysine_3" metaboliteGlyph="Layout_23" role="substrate">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_54" name="glyph_LDHAL6A__lactate_dehydrogenase_A_like_6A14_1">
          <Curve>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_55" name="glyph_C00186SLactate_3" metaboliteGlyph="Layout_15" role="substrate">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_56" name="glyph_C00022Pyruvate_3" metaboliteGlyph="Layout_18" role="product">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_57" name="glyph_PKLR__pyruvate_kinase_LR16_1" reaction="Reaction_10">
          <Curve>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_58" name="glyph_C00074Phosphoenolpyruvate_5" metaboliteGlyph="Layout_12" role="substrate">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_59" name="glyph_C00022Pyruvate_4" metaboliteGlyph="Layout_18" role="product">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_60" name="glyph_ENO1__enolase_118_1" reaction="Reaction_0">
          <Curve>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_61" name="glyph_C006312PhosphoDglycerate_3" metaboliteGlyph="Layout_5" role="substrate">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_62" name="glyph_C00074Phosphoenolpyruvate_4" metaboliteGlyph="Layout_12" role="product">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_63" name="glyph_PGAM4__phosphoglycerate_mutase_family_member_419_1" reaction="Reaction_1">
          <Curve>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_64" name="glyph_C006312PhosphoDglycerate_4" metaboliteGlyph="Layout_5" role="substrate">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_65" name="glyph_C001973PhosphoDglycerate_5" metaboliteGlyph="Layout_13" role="product">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_66" name="glyph_GAPDH__glyceraldehyde3phosphate_dehydrogenase20_1" reaction="Reaction_8">
          <Curve>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_67" name="glyph_C002363PhosphoDglyceroyl_phosphate_5" metaboliteGlyph="Layout_14" role="product">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_68" name="glyph_C00118DGlyceraldehyde_3phosphate_5" metaboliteGlyph="Layout_27" role="substrate">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_69" name="glyph_TPI1__triosephosphate_isomerase_121_1" reaction="Reaction_2">
          <Curve>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_70" name="glyph_C00111Glycerone_phosphate_4" metaboliteGlyph="Layout_8" role="product">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_71" name="glyph_C00118DGlyceraldehyde_3phosphate_4" metaboliteGlyph="Layout_27" role="substrate">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_72" name="glyph_ALDOA__aldolase_fructosebisphosphate_A0_1" reaction="Reaction_3">
          <Curve>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_73" name="glyph_C00111Glycerone_phosphate_3" metaboliteGlyph="Layout_8" role="product">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_74" name="glyph_C05378betaDFructose_16bisphosphate_3" metaboliteGlyph="Layout_24" role="substrate">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_75" name="glyph_C00118DGlyceraldehyde_3phosphate_3" metaboliteGlyph="Layout_27" role="product">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_76" name="glyph_PFKL__phosphofructokinase_liver_type22_1" reaction="Reaction_7">
          <Curve>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_77" name="glyph_C05345betaDFructose_6phosphate_5" metaboliteGlyph="Layout_11" role="substrate">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_78" name="glyph_C05378betaDFructose_16bisphosphate_5" metaboliteGlyph="Layout_24" role="product">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_79" name="glyph_FBP1__fructosebisphosphatase_123_1">
          <Curve>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_80" name="glyph_C05345betaDFructose_6phosphate_4" metaboliteGlyph="Layout_11" role="product">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_81" name="glyph_C05378betaDFructose_16bisphosphate_4" metaboliteGlyph="Layout_24" role="substrate">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_82" name="glyph_GPI__glucose6phosphate_isomerase25_1" reaction="Reaction_4">
          <Curve>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_83" name="glyph_C00668alphaDGlucose_6phosphate_9" metaboliteGlyph="Layout_10" role="substrate">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_84" name="glyph_C05345betaDFructose_6phosphate_6" metaboliteGlyph="Layout_11" role="product">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_85" name="glyph_PGM1__phosphoglucomutase_126_1">
          <Curve>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_86" name="glyph_C00103DGlucose_1phosphate_3" metaboliteGlyph="Layout_4" role="substrate">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_87" name="glyph_C00668alphaDGlucose_6phosphate_8" metaboliteGlyph="Layout_10" role="product">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_88" name="glyph_GPI__glucose6phosphate_isomerase27_1">
          <Curve>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_89" name="glyph_C01172betaDGlucose_6phosphate_4" metaboliteGlyph="Layout_9" role="substrate">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_90" name="glyph_C05345betaDFructose_6phosphate_3" metaboliteGlyph="Layout_11" role="product">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_91" name="glyph_HK1__hexokinase_128_1">
          <Curve>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_92" name="glyph_C00221betaDGlucose_3" metaboliteGlyph="Layout_7" role="substrate">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_93" name="glyph_C00221betaDGlucose_4" metaboliteGlyph="Layout_7" role="substrate">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_94" name="glyph_C01172betaDGlucose_6phosphate_3" metaboliteGlyph="Layout_9" role="product">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_95" name="glyph_C01172betaDGlucose_6phosphate_5" metaboliteGlyph="Layout_9" role="product">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_96" name="glyph_GPI__glucose6phosphate_isomerase30_1">
          <Curve>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_97" name="glyph_C01172betaDGlucose_6phosphate_7" metaboliteGlyph="Layout_9" role="product">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_98" name="glyph_C00668alphaDGlucose_6phosphate_7" metaboliteGlyph="Layout_10" role="substrate">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_99" name="glyph_GALM__galactose_mutarotase32_1">
          <Curve>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_100" name="glyph_C00267alphaDGlucose_7" metaboliteGlyph="Layout_6" role="substrate">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_101" name="glyph_C00221betaDGlucose_6" metaboliteGlyph="Layout_7" role="product">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_102" name="glyph_GCK__glucokinase33_1">
          <Curve>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_103" name="glyph_C00267alphaDGlucose_5" metaboliteGlyph="Layout_6" role="substrate">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_104" name="glyph_C00267alphaDGlucose_6" metaboliteGlyph="Layout_6" role="substrate">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_105" name="glyph_C00668alphaDGlucose_6phosphate_5" metaboliteGlyph="Layout_10" role="product">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_106" name="glyph_C00668alphaDGlucose_6phosphate_6" metaboliteGlyph="Layout_10" role="product">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_107" name="glyph_G6PC1__glucose6phosphatase_catalytic_subunit_135_1">
          <Curve>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_108" name="glyph_C00267alphaDGlucose_4" metaboliteGlyph="Layout_6" role="product">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_109" name="glyph_C00668alphaDGlucose_6phosphate_4" metaboliteGlyph="Layout_10" role="substrate">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_110" name="glyph_DLD__dihydrolipoamide_dehydrogenase38_1">
          <Curve>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_111" name="glyph_C15972Enzyme_N6lipoyllysine_4" metaboliteGlyph="Layout_16" role="product">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_112" name="glyph_C15973Enzyme_N6dihydrolipoyllysine_4" metaboliteGlyph="Layout_23" role="substrate">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_113" name="glyph_PGK1__phosphoglycerate_kinase_139_1" reaction="Reaction_9">
          <Curve>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_114" name="glyph_C001973PhosphoDglycerate_4" metaboliteGlyph="Layout_13" role="substrate">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_115" name="glyph_C002363PhosphoDglyceroyl_phosphate_3" metaboliteGlyph="Layout_14" role="product">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_116" name="glyph_PCK1__phosphoenolpyruvate_carboxykinase_172_1">
          <Curve>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_117" name="glyph_C00074Phosphoenolpyruvate_3" metaboliteGlyph="Layout_12" role="product">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_118" name="glyph_C00036Oxaloacetate_3" metaboliteGlyph="Layout_25" role="substrate">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_119" name="glyph_BPGM__bisphosphoglycerate_mutase83_1">
          <Curve>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_120" name="glyph_C001973PhosphoDglycerate_3" metaboliteGlyph="Layout_13" role="product">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_121" name="glyph_C0115923BisphosphoDglycerate_3" metaboliteGlyph="Layout_26" role="substrate">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_122" name="glyph_BPGM__bisphosphoglycerate_mutase84_1">
          <Curve>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_123" name="glyph_C002363PhosphoDglyceroyl_phosphate_4" metaboliteGlyph="Layout_14" role="substrate">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_124" name="glyph_C0115923BisphosphoDglycerate_4" metaboliteGlyph="Layout_26" role="product">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_125" name="glyph_ACSS2__acylCoA_synthetase_short_chain_family_member_286_1">
          <Curve>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_126" name="glyph_C00033Acetate_3" metaboliteGlyph="Layout_3" role="substrate">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_127" name="glyph_C00024AcetylCoA_3" metaboliteGlyph="Layout_20" role="product">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_128" name="glyph_ADPGK__ADP_dependent_glucokinase88_1">
          <Curve>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_129" name="glyph_C00267alphaDGlucose_3" metaboliteGlyph="Layout_6" role="substrate">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_130" name="glyph_C00668alphaDGlucose_6phosphate_3" metaboliteGlyph="Layout_10" role="product">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_131" name="glyph_ADPGK__ADP_dependent_glucokinase89_1">
          <Curve>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_132" name="glyph_C00221betaDGlucose_5" metaboliteGlyph="Layout_7" role="substrate">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_133" name="glyph_C01172betaDGlucose_6phosphate_6" metaboliteGlyph="Layout_9" role="product">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_134" name="glyph_MINPP1__multiple_inositolpolyphosphate_phosphatase_194_1">
          <Curve>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_135" name="glyph_C006312PhosphoDglycerate_5" metaboliteGlyph="Layout_5" role="product">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_136" name="glyph_C0115923BisphosphoDglycerate_5" metaboliteGlyph="Layout_26" role="substrate">
              <BoundingBox>
                <Position x="0" y="0"/>
                <Dimensions width="0" height="0"/>
              </BoundingBox>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
      </ListOfReactionGlyphs>
      <ListOfTextGlyphs>
        <TextGlyph key="Layout_137" name="glyph_C00033Acetate_2" graphicalObject="Layout_3" text="unset">
          <BoundingBox>
            <Position x="0" y="0"/>
            <Dimensions width="0" height="0"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_138" name="glyph_C00103DGlucose_1phosphate_2" graphicalObject="Layout_4" text="unset">
          <BoundingBox>
            <Position x="0" y="0"/>
            <Dimensions width="0" height="0"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_139" name="glyph_C006312PhosphoDglycerate_2" graphicalObject="Layout_5" originOfText="Metabolite_0">
          <BoundingBox>
            <Position x="0" y="0"/>
            <Dimensions width="0" height="0"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_140" name="glyph_C00267alphaDGlucose_2" graphicalObject="Layout_6" text="unset">
          <BoundingBox>
            <Position x="0" y="0"/>
            <Dimensions width="0" height="0"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_141" name="glyph_C00221betaDGlucose_2" graphicalObject="Layout_7" text="unset">
          <BoundingBox>
            <Position x="0" y="0"/>
            <Dimensions width="0" height="0"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_142" name="glyph_C00111Glycerone_phosphate_2" graphicalObject="Layout_8" originOfText="Metabolite_1">
          <BoundingBox>
            <Position x="0" y="0"/>
            <Dimensions width="0" height="0"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_143" name="glyph_C01172betaDGlucose_6phosphate_2" graphicalObject="Layout_9" text="unset">
          <BoundingBox>
            <Position x="0" y="0"/>
            <Dimensions width="0" height="0"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_144" name="glyph_C00668alphaDGlucose_6phosphate_2" graphicalObject="Layout_10" originOfText="Metabolite_2">
          <BoundingBox>
            <Position x="0" y="0"/>
            <Dimensions width="0" height="0"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_145" name="glyph_C05345betaDFructose_6phosphate_2" graphicalObject="Layout_11" originOfText="Metabolite_3">
          <BoundingBox>
            <Position x="0" y="0"/>
            <Dimensions width="0" height="0"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_146" name="glyph_C00074Phosphoenolpyruvate_2" graphicalObject="Layout_12" originOfText="Metabolite_4">
          <BoundingBox>
            <Position x="0" y="0"/>
            <Dimensions width="0" height="0"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_147" name="glyph_C001973PhosphoDglycerate_2" graphicalObject="Layout_13" originOfText="Metabolite_5">
          <BoundingBox>
            <Position x="0" y="0"/>
            <Dimensions width="0" height="0"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_148" name="glyph_C002363PhosphoDglyceroyl_phosphate_2" graphicalObject="Layout_14" originOfText="Metabolite_6">
          <BoundingBox>
            <Position x="0" y="0"/>
            <Dimensions width="0" height="0"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_149" name="glyph_C00186SLactate_2" graphicalObject="Layout_15" text="unset">
          <BoundingBox>
            <Position x="0" y="0"/>
            <Dimensions width="0" height="0"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_150" name="glyph_C15972Enzyme_N6lipoyllysine_2" graphicalObject="Layout_16" text="unset">
          <BoundingBox>
            <Position x="0" y="0"/>
            <Dimensions width="0" height="0"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_151" name="glyph_C00469Ethanol_2" graphicalObject="Layout_17" text="unset">
          <BoundingBox>
            <Position x="0" y="0"/>
            <Dimensions width="0" height="0"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_152" name="glyph_C00022Pyruvate_2" graphicalObject="Layout_18" originOfText="Metabolite_7">
          <BoundingBox>
            <Position x="0" y="0"/>
            <Dimensions width="0" height="0"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_153" name="glyph_C051252alphaHydroxyethylthiamine_diphosphate_2" graphicalObject="Layout_19" text="unset">
          <BoundingBox>
            <Position x="0" y="0"/>
            <Dimensions width="0" height="0"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_154" name="glyph_C00024AcetylCoA_2" graphicalObject="Layout_20" text="unset">
          <BoundingBox>
            <Position x="0" y="0"/>
            <Dimensions width="0" height="0"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_155" name="glyph_C00084Acetaldehyde_2" graphicalObject="Layout_21" text="unset">
          <BoundingBox>
            <Position x="0" y="0"/>
            <Dimensions width="0" height="0"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_156" name="glyph_C16255Dihydrolipoyllysineresidue_acetyltransferase_Sacetyldihydrolipoyllysine_2" graphicalObject="Layout_22" text="unset">
          <BoundingBox>
            <Position x="0" y="0"/>
            <Dimensions width="0" height="0"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_157" name="glyph_C15973Enzyme_N6dihydrolipoyllysine_2" graphicalObject="Layout_23" text="unset">
          <BoundingBox>
            <Position x="0" y="0"/>
            <Dimensions width="0" height="0"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_158" name="glyph_C05378betaDFructose_16bisphosphate_2" graphicalObject="Layout_24" originOfText="Metabolite_8">
          <BoundingBox>
            <Position x="0" y="0"/>
            <Dimensions width="0" height="0"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_159" name="glyph_C00036Oxaloacetate_2" graphicalObject="Layout_25" text="unset">
          <BoundingBox>
            <Position x="0" y="0"/>
            <Dimensions width="0" height="0"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_160" name="glyph_C0115923BisphosphoDglycerate_2" graphicalObject="Layout_26" text="unset">
          <BoundingBox>
            <Position x="0" y="0"/>
            <Dimensions width="0" height="0"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_161" name="glyph_C00118DGlyceraldehyde_3phosphate_2" graphicalObject="Layout_27" originOfText="Metabolite_9">
          <BoundingBox>
            <Position x="0" y="0"/>
            <Dimensions width="0" height="0"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_162" name="glyph_C00068Thiamin_diphosphate_2" graphicalObject="Layout_28" text="unset">
          <BoundingBox>
            <Position x="0" y="0"/>
            <Dimensions width="0" height="0"/>
          </BoundingBox>
        </TextGlyph>
      </ListOfTextGlyphs>
    </Layout>
  </ListOfLayouts>
  <SBMLReference file="hsa00010.xml">
    <SBMLMap SBMLid="ALDOA__aldolase_fructosebisphosphate_A0" COPASIkey="Reaction_3"/>
    <SBMLMap SBMLid="C00022Pyruvate" COPASIkey="Metabolite_7"/>
    <SBMLMap SBMLid="C00074Phosphoenolpyruvate" COPASIkey="Metabolite_4"/>
    <SBMLMap SBMLid="C00111Glycerone_phosphate" COPASIkey="Metabolite_1"/>
    <SBMLMap SBMLid="C00118DGlyceraldehyde_3phosphate" COPASIkey="Metabolite_9"/>
    <SBMLMap SBMLid="C001973PhosphoDglycerate" COPASIkey="Metabolite_5"/>
    <SBMLMap SBMLid="C002363PhosphoDglyceroyl_phosphate" COPASIkey="Metabolite_6"/>
    <SBMLMap SBMLid="C006312PhosphoDglycerate" COPASIkey="Metabolite_0"/>
    <SBMLMap SBMLid="C00668alphaDGlucose_6phosphate" COPASIkey="Metabolite_2"/>
    <SBMLMap SBMLid="C05345betaDFructose_6phosphate" COPASIkey="Metabolite_3"/>
    <SBMLMap SBMLid="C05378betaDFructose_16bisphosphate" COPASIkey="Metabolite_8"/>
    <SBMLMap SBMLid="ENO1__enolase_118" COPASIkey="Reaction_0"/>
    <SBMLMap SBMLid="GPI__glucose6phosphate_isomerase25" COPASIkey="Reaction_4"/>
    <SBMLMap SBMLid="PGAM4__phosphoglycerate_mutase_family_member_419" COPASIkey="Reaction_1"/>
    <SBMLMap SBMLid="TPI1__triosephosphate_isomerase_121" COPASIkey="Reaction_2"/>
    <SBMLMap SBMLid="default" COPASIkey="Compartment_0"/>
  </SBMLReference>
  <ListOfUnitDefinitions>
    <UnitDefinition key="Unit_1" name="meter" symbol="m">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_0">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        m
      </Expression>
    </UnitDefinition>
    <UnitDefinition key="Unit_5" name="second" symbol="s">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_4">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        s
      </Expression>
    </UnitDefinition>
    <UnitDefinition key="Unit_13" name="Avogadro" symbol="Avogadro">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_12">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Avogadro
      </Expression>
    </UnitDefinition>
    <UnitDefinition key="Unit_17" name="item" symbol="#">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_16">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        #
      </Expression>
    </UnitDefinition>
    <UnitDefinition key="Unit_35" name="liter" symbol="l">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_34">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        0.001*m^3
      </Expression>
    </UnitDefinition>
    <UnitDefinition key="Unit_41" name="mole" symbol="mol">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_40">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Avogadro*#
      </Expression>
    </UnitDefinition>
  </ListOfUnitDefinitions>
</COPASI>
