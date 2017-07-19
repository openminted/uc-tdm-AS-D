<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:a="xalan://org.bibliome.alvisnlp.modules.xml.XMLWriter2"
                xmlns:b="http://bilbiome.jouy.inra.fr/alvisnlp/XMLReader2"
                xmlns:inline="http://bibliome.jouy.inra.fr/alvisnlp/bibliome-module-factory/inline"
		extension-element-prefixes="a b inline"
>

  <xsl:output method="xml" omit-xml-declaration="yes" indent="no"/>



<xsl:template match="child::node()|@*|node()">
    <xsl:copy>
        <xsl:apply-templates select="child::node()|@*|node()"/>
    </xsl:copy>
</xsl:template>

<!-- <xsl:template match="text()"> -->
    <!-- <xsl:value-of select="normalize-space(.)"/> -->
<!-- </xsl:template> -->
<xsl:template match="text()">
  <xsl:value-of select=
  "concat(substring(' ', 1 + not(substring(.,1,1)=' ')),
          normalize-space(),
          substring(' ', 1 + not(substring(., string-length(.)) = ' '))
          )
  "/>
  </xsl:template>

<xsl:template match="b:element">
  <xsl:choose>
    <xsl:when test="@type='ne'">
      <!-- <xsl:element name="{@ne-type}"> -->
      <xsl:element name="span">
	<xsl:attribute name="class">
	  <xsl:value-of select="@ne-type"/>
	</xsl:attribute>
	<xsl:choose>
	  <xsl:when test="@ne-type='gene'">
	    <xsl:attribute name="style">background-color: blue</xsl:attribute>
	  </xsl:when>
	  <xsl:when test="@ne-type='phenotype'">
	    <xsl:attribute name="style">background-color: green</xsl:attribute>
	  </xsl:when>
	  <xsl:when test="@ne-type='marker'">
	    <xsl:attribute name="style">background-color: red</xsl:attribute>
	  </xsl:when>
	  <xsl:when test="@ne-type='taxon'">
	    <xsl:attribute name="style">background-color: yellow</xsl:attribute>
	  </xsl:when>
	  <xsl:when test="@ne-type='accession'">
	    <xsl:attribute name="style">background-color: pink</xsl:attribute>
	  </xsl:when>
	</xsl:choose>
	<xsl:apply-templates select="child::node()"/>
      </xsl:element>
    </xsl:when>
  </xsl:choose>
</xsl:template>

  <xsl:template match="/">
    <xsl:for-each select="a:elements('documents')">
      <xsl:text>Bibliography&#9;</xsl:text>
      <xsl:text>OpenMinTeD&#9;</xsl:text>
      <xsl:value-of select="@DI"/>
      <xsl:text>&#9;</xsl:text>
      <xsl:text>1&#9;</xsl:text>
      <xsl:for-each select="a:elements('sections:TI|sections:AB')">
	<xsl:for-each select="a:inline('layer:genes|layer:markers|layer:taxa|layer:phenotypes|layer:accessions')">
	  <xsl:apply-templates select="child::node()"/>
	</xsl:for-each>
	<xsl:text> </xsl:text>
      </xsl:for-each>
      <xsl:value-of select="@entities"/>
      <xsl:text>&#9;</xsl:text>
      <xsl:text>http://oadoi.org/</xsl:text>
      <xsl:value-of select="@DI"/>
      <xsl:text>&#9;</xsl:text>
      <xsl:text>Triticum&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;&#9;</xsl:text>
      <xsl:text>&#10;</xsl:text>
    </xsl:for-each>
  </xsl:template>

</xsl:stylesheet>
