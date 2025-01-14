package com.spike.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity // JPA 엔티티임을 선언
@Table(name = "stocks") // 데이터베이스 테이블 이름 매핑
public class Stock {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // 기본 키 생성 전략
    private int stockId;

    private String name;
    private String tickerSymbol;
    private String sector;
    private double initialPrice;
    private double currentPrice;
    private int totalShares;
    private int availableShares;

    // 기본 생성자
    public Stock() {}

    // 모든 필드를 포함한 생성자
    public Stock(int stockId, String name, String tickerSymbol, String sector, double initialPrice, double currentPrice, int totalShares, int availableShares) {
        this.stockId = stockId;
        this.name = name;
        this.tickerSymbol = tickerSymbol;
        this.sector = sector;
        this.initialPrice = initialPrice;
        this.currentPrice = currentPrice;
        this.totalShares = totalShares;
        this.availableShares = availableShares;
    }

    // Getter와 Setter
    public int getStockId() {
        return stockId;
    }

    public void setStockId(int stockId) {
        this.stockId = stockId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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
}