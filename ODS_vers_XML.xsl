<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0"
    xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0"
    xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0" 
    exclude-result-prefixes="office table text"
    version="1.0"
    >
    <xsl:output indent="yes" method="xml" />
    <xsl:strip-space elements="*"/>
    <!-- Export ods to xml with proper tag names -->
    <xsl:template match="/">
        <ooo_calc_export scriptVersion="0.1" scriptUpdate="2016-01-17"
            scriptAuthor="jbc">
            <!-- treat only tables that have one row of content (colnames excepted) -->
            <xsl:apply-templates select="descendant::table:table[table:table-row[2]]"/>
        </ooo_calc_export>
    </xsl:template>
    
    <xsl:template match="table:table">
        <xsl:element name="{@table:name}">
            <!-- process all rows except the first -->
        <xsl:apply-templates select="table:table-row[preceding-sibling::table:table-row]"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="table:table-row">
        <xsl:element name="row">
            <xsl:attribute name="n"><xsl:value-of select="position()"/></xsl:attribute>
            <xsl:apply-templates select="table:table-cell"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="table:table-cell">
        <!-- retrieve the name from the first row containing column names -->
        <xsl:variable name="position" select="position()"/>
        <xsl:element name="{ancestor::table:table/child::table:table-row[1]/child::table:table-cell[position() = $position]}">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
</xsl:stylesheet>