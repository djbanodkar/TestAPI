#
# Copyright (C) 2011 Instructure, Inc.
#
# This file is part of Canvas.
#
# Canvas is free software: you can redistribute it and/or modify it under
# the terms of the GNU Affero General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# Canvas is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
# details.
#
# You should have received a copy of the GNU Affero General Public License along
# with this program. If not, see <http://www.gnu.org/licenses/>.
#

class StreamItemInstance < ActiveRecord::Base
  include Workflow

  belongs_to :user
  belongs_to :stream_item

  attr_accessible :user_id, :stream_item

  before_save :set_context_code
  def set_context_code
    self.context_code = stream_item && stream_item.context_code
  end

  workflow do
    state :read
    state :unread
  end
end
