///////////////////////////////////////////////////////////////////////////////////
// 
//  Copyright (c) 2014 Nailson <nailsonnego@gmail.com>
// 
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
// 
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
// 
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//
///////////////////////////////////////////////////////////////////////////////////

package otlib.things
{
    import nail.otlib.things.ThingCategory;

    public class FrameDuration
    {
        //--------------------------------------------------------------------------
        // PROPERTIES
        //--------------------------------------------------------------------------
        
        public var minimum:uint;
        public var maximum:uint;
        
        //--------------------------------------
        // Getters / Setters
        //--------------------------------------
        
        public function get duration():uint
        {
            if (minimum == maximum)
                return minimum;
            
            var value:int = maximum - minimum;
            return minimum + Math.round(Math.random() * value);
        }
        
        //--------------------------------------------------------------------------
        // CONSTRUCTOR
        //--------------------------------------------------------------------------
        
        public function FrameDuration(minimum:uint = 0, maximum:uint = 0)
        {
            this.minimum = minimum;
            this.maximum = maximum;
        }
        
        //--------------------------------------------------------------------------
        // METHODS
        //--------------------------------------------------------------------------
        
        //--------------------------------------
        // Public
        //--------------------------------------
        
        public function toString():String
        {
            return "[object FrameDuration minimum=" + minimum + ", maximum=" + maximum + "]";
        }
        
        public function clone():FrameDuration
        {
            return new FrameDuration(this.minimum, this.maximum);
        }
        
        //--------------------------------------------------------------------------
        // STATIC
        //--------------------------------------------------------------------------
        
        public static function getDefaultDuration(category:String):uint
        {
            switch(category) {
                case ThingCategory.ITEM:
                    return 500;
                case ThingCategory.OUTFIT:
                    return 300;
                case ThingCategory.EFFECT:
                    return 100;
                case ThingCategory.MISSILE:
                    return 0;
            }
            return 0;
        }
    }
}
