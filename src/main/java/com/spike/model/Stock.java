package com.spike.model;

import javax.persistence.*;

@Entity
@Table(name = "Stock") // 데이터베이스 테이블과 매핑
public class Stock {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "stock_id")
    private int stockId;
    
    @Column(name = "stock_code", unique = true, nullable = false, length = 8)
    private String stockCode; // 섹터 및 순서를 포함한 고유 코드

    @Column(name = "company_name", nullable = false, length = 100)
    private String companyName;

    @Column(name = "ticker_symbol", unique = true, nullable = false, length = 255)
    private String tickerSymbol;

    @Column(name = "sector", nullable = false, length = 100)
    private String sector;

    @Column(name = "initial_price", nullable = false)
    private double initialPrice;

    @Column(name = "current_price", nullable = false)
    private double currentPrice;

    @Column(name = "total_shares", nullable = false)
    private int totalShares;

    @Column(name = "available_shares", nullable = false)
    private int availableShares;

    @Column(name = "is_active", nullable = false)
    private int isActive = 1; // 기본값 설정 (1: 활성)

    @Column(name = "created_date", nullable = false, columnDefinition = "DATE DEFAULT SYSDATE")
    private java.sql.Date createdDate;

    // 기본 생성자
    public Stock() {}

    // 전체 매개변수를 포함한 생성자
    public Stock(String stockCode, String companyName, String tickerSymbol, String sector, 
                 double initialPrice, double currentPrice, int totalShares, 
                 int availableShares, int isActive, java.sql.Date createdDate) {
        this.stockCode = stockCode;
        this.companyName = companyName;
        this.tickerSymbol = tickerSymbol;
        this.sector = sector;
        this.initialPrice = initialPrice;
        this.currentPrice = currentPrice;
        this.totalShares = totalShares;
        this.availableShares = availableShares;
        this.isActive = isActive;
        this.createdDate = createdDate;
    }

    // Getter 및 Setter
    public int getStockId() {
        return stockId;
    }

    public void setStockId(int stockId) {
        this.stockId = stockId;
    }
    
    public String getStockCode() {
        return stockCode;
    }

    public void setStockCode(String stockCode) {
        this.stockCode = stockCode;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getTickerSymbol() {
        return tickerSymbol;
    }

    public void setTickerSymbol(String tickerSymbol) {
        this.tickerSymbol = tickerSymbol;
    }

    public String getSector() {
        return sector;
    }

    public void setSector(String sector) {
        this.sector = sector;
    }

    public double getInitialPrice() {
        return initialPrice;
    }

    public void setInitialPrice(double initialPrice) {
        this.initialPrice = initialPrice;
    }

    public double getCurrentPrice() {
        return currentPrice;
    }

    public void setCurrentPrice(double currentPrice) {
        this.currentPrice = currentPrice;
    }

    public int getTotalShares() {
        return totalShares;
    }

    public void setTotalShares(int totalShares) {
        this.totalShares = totalShares;
    }

    public int getAvailableShares() {
        return availableShares;
    }

    public void setAvailableShares(int availableShares) {
        this.availableShares = availableShares;
    }

    public int getIsActive() {
        return isActive;
    }

    public void setIsActive(int isActive) {
        this.isActive = isActive;
    }

    public java.sql.Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(java.sql.Date createdDate) {
        this.createdDate = createdDate;
    }
}
