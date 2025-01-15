package com.spike.model;

public class Stock {
    private String name;
    private int quantity;
    private int currentPrice;
    private int totalValue;
    private double profitRate;

    public Stock(String name, int quantity, int currentPrice, int totalValue, double profitRate) {
        this.name = name;
        this.quantity = quantity;
        this.currentPrice = currentPrice;
        this.totalValue = totalValue;
        this.profitRate = profitRate;
    }

    // Getter와 Setter
    public String getName() {
        return name;
    }

    public int getQuantity() {
        return quantity;
    }

    public int getCurrentPrice() {
        return currentPrice;
    }

    public int getTotalValue() {
        return totalValue;
    }

    public double getProfitRate() {
        return profitRate;
    }
}
