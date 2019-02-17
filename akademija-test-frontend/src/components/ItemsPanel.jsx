import React, { Component } from 'react';
import ItemCard from './ItemCard';
import AdvertsPanel from './AdvertsPanel';

class ItemsPanel extends Component {
    constructor(props) {
        super(props);
        this.state = {  }
    }
    render() { 
        return (
            <>
                <AdvertsPanel/>
                <div className="row">
                    <ItemCard />
                    <ItemCard />
                    <ItemCard />
                    <ItemCard />
                    <ItemCard />
                    <ItemCard />
                </div>
            </>
        );
    }
}
 
export default ItemsPanel;