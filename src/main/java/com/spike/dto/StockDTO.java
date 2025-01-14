package com.spike.dto;

public class StockDTO {
    private int stockId;
    private String stockCode; // 새로운 필드 추가
    private String companyName;
    private String tickerSymbol;
    private String sector;
    private double initialPrice;
    private double currentPrice;
    private int totalShares;
    private int availableShares;

    // Getter와 Setter
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
}
