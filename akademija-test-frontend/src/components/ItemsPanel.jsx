import React, { Component } from 'react';
import ItemCard from './ItemCard';

class ItemsPanel extends Component {
    constructor(props) {
        super(props);
        this.state = {  }
    }
    render() { 
        return (
            <div class="row">
                <ItemCard />
                <ItemCard />
                <ItemCard />
                <ItemCard />
                <ItemCard />
                <ItemCard />
            </div>
        );
    }
}
 
export default ItemsPanel;