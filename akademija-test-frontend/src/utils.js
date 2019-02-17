/**
 * Handles input element change event.
 * 
 * @param {*} e 
 */
export function handleChange(e){
    this.setState({
        [e.target.name]: e.target.value
    });
};